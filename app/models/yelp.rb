class Yelp

  def self.search(place)
    results = HTTParty.get("http://api.yelp.com/phone_search?phone=1#{place.phone}&ywsid=#{ENV['YWSID']}")
    if results['message']['code'] == 0 
      return results['businesses'][0]
    else
      return false
    end
  end
end