class Foursquare

  def self.make_request(code, user)
    response_code = HTTParty.get("https://foursquare.com/oauth2/access_token?client_id=#{ENV['CLIENT_ID']}&client_secret=#{ENV['CLIENT_SECRET']}&grant_type=authorization_code&redirect_uri=#{ENV['REDIRECT_URI']}&code=#{code}")
    user.update_attributes(access_token: response_code['access_token'])
  end

  def self.get_info(user)
    response_code = HTTParty.get("https://api.foursquare.com/v2/users/self?oauth_token=#{user.access_token}&v=20140518")
  end

end