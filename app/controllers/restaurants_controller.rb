class RestaurantsController < ApplicationController

	def index
		if logged_in? && params[:code] 
			Foursquare.make_request(params[:code], current_user)
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@inspection_results = Inspection.where(restaurant_id: @restaurant.id).group_by(&:inspected_on)
		@boro = { '1' => 'Manhattan', '2' => 'Bronx', '3' => 'Brooklyn', '4' => 'Queens', '5' => 'Staten Island'}
	end

	def search
		@restaurants = Restaurant.search(params[:zip_or_name])
		respond_to do |format|
			format.js {}
		end
	end

	def favorite
		@restaurant = Restaurant.find(params[:id])
		current_user.favorite(@restaurant)
		respond_to do |format|
			format.html {render nothing: true}
			format.js {}
		end
	end

	def unfavorite
		@restaurant = Restaurant.find(params[:id])
		current_user.unfavorite(@restaurant)
		respond_to do |format|
			format.html {render nothing: true}
			format.js {}
		end
	end
end