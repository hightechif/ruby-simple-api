require 'open-uri'
require 'net/http'
require 'net/https'

class Weather < ApplicationRecord

  def self.fetch_api
    @cities = ['jakarta', 'yogyakarta', 'surabaya', 'semarang', 'bandung', 'medan', 'bali', 'lombok']

    @cities.each do |city|
      yqlquery = "SELECT * FROM weather.forecast WHERE woeid in (SELECT woeid FROM geo.places(1) WHERE text='#{city}')"
      apiyql = URI 'https://query.yahooapis.com/v1/public/yql?q='+URI.encode(yqlquery)+'&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys'
      respon = Net::HTTP.get(apiyql)
      convjson = JSON.parse respon
      @rlocation = convjson['query']['results']['channel']
      
      @result = @rlocation['item']['forecast'].each do |key, value|
        @weather  = Weather.find_or_create_by(date: key['date'], location: @rlocation['location']['city']) do |e|
          e.code  = key['code']
          e.high  = key['high']
          e.low   = key['low']
          e.level = key['text']
          e.save
        end
      end
    end
    
    return @cities
  end

end
