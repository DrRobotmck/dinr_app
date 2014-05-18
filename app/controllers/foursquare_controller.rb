class FoursquareController < ApplicationController


  def make_request
    binding.pry
    code = Foursquare.make_request
  end

end