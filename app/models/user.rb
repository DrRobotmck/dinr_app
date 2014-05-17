class User < ActiveRecord::Base
	has_secure_password
	has_and_belongs_to_many :restaurants

	def favorite(restaurant)
		unless self.restaurants.include?(restaurant)
			self.restaurants.push(restaurant)
			return true
		end
	end
	def unfavorite(restaurant)
		if self.restaurants.include?(restaurant)
			self.restaurants.destroy(restaurant)
			return true
		end
	end
end