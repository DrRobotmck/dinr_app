class RestaurantsController < ApplicationController

	def index
		ip_results = Geocoder.search(request.ip)[0].data
		session[:ip_address] = [ip_results['latitude'], ip_results['longitude']]
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@yelp_results = Yelp.search(@restaurant)
		@inspection_results = Inspection.where(restaurant_id: @restaurant.id).group_by(&:inspected_on)
		@boro = { '1' => 'Manhattan', '2' => 'Bronx', '3' => 'Brooklyn', '4' => 'Queens', '5' => 'Staten Island'}
		respond_to { |format| format.js {} }
	end

	def search
		@restaurants = Restaurant.search(params[:zip_or_name])
		@restaurant_coords = session[:ip_address]
		respond_to { |format| format.js {} }
	end

	def favorite
		@restaurant = Restaurant.find(params[:id])
		current_user.favorite(@restaurant)
		respond_to do |format|
			format.html { render nothing: true }
			format.js {}
		end
	end

	def unfavorite
		@restaurant = Restaurant.find(params[:id])
		current_user.unfavorite(@restaurant)
		respond_to do |format|
			format.html { render nothing: true }
			format.js {}
		end
	end

end