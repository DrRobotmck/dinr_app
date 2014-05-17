class Restaurant < ActiveRecord::Base
	has_and_belongs_to_many :users
	has_many :inspections

	def self.search(param)
		if param.to_i == 0
			return self.where('LOWER(name) similar to ?', '%' +param.downcase + '%')
		else
			return self.where(zip: param.to_i)
		end
	end
end