class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show

    @restaurant = Restaurant.find(params[:id]) # GET /restaurantss/:id
       @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new       # GET /restaurantss/new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if  @restaurant.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "Successfully created"
    else
      render :new
      flash[:alert] = "Check your must-complete blocks"
    end      # POST /restaurantss
  end

  def edit
    @restaurant = Restaurant.find(params[:id])     # GET /restaurantss/:id/edit
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
     redirect_to restaurants_path(@restaurant)
     flash[:notice] = "Successfully created"
    else
      render :new
      flash[:alert] = "Check your must-complete blocks"
    end
    # PATCH /restaurantss/:id
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path    # DELETE /restaurantss/:id
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number, :rating)
  end
end
