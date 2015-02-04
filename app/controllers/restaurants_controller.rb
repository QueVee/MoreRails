class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all 
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.create(params.require(:restaurant).permit(:name, :address, :phone))
		#same as
		#@restaurant = Restaurant.new(params[:restaurant])
		#@restaurant.save
		redirect_to restaurants_url 
		#same as users path we had in users index
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reviews = @restaurant.reviews.all
		@review = @restaurant.reviews.build
	end
	
end
