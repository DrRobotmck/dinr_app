class RestaurantsController < ApplicationController

	def index
		request_ip = '98.14.80.187'
		# ip_results = Geocoder.search(request.ip)[0].data
		# ip_results = Geocoder.search(request_ip)[0].data
		# session[:ip_address] = [ip_results['latitude'], ip_results['longitude']]
		# session[:zip_code] = ip_results['zipcode']
	end

	def fetch
			# render json: Restaurant.limit(params[:limit]).where(zip: session[:zip_code]).as_json(include: :inspections)
			render json: Restaurant.where(zip: '11222')
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		# @yelp_results = Yelp.search(@restaurant)
		@inspection_results = Inspection.where(restaurant_id: @restaurant.id)
																		.group_by(&:inspected_on)
		@boro = { '1' => 'Manhattan',
						  '2' => 'Bronx', 
						  '3' => 'Brooklyn', 
						  '4' => 'Queens', 
						  '5' => 'Staten Island'
						}
		render json: {restaurant: @restaurant.as_json(include: :inspections), yelp_results: @yelp_results}
	end

	def search
		@restaurants = Restaurant.search(params[:zip_or_name])
		@restaurant_coords = session[:ip_address] = [40.7293373,-73.9458161]
		render json: @restaurants
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