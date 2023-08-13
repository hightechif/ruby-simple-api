require 'open-uri'
require 'net/http'
require 'net/https'

class News < ApplicationRecord

  def self.fetch_api
    uri  = URI("https://api.nytimes.com/svc/search/v2/articlesearch.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "f1dd8802643a43a0aa92c7bad81d377f",
      "q" => "indonesia earthquake",
      "sort" => "newest"
    })

    request  = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)

    @result['response']['docs'].each do |key, value|
      @news   = News.find_or_create_by(url: key['web_url']) do |e|
        e.image = !key['multimedia'].empty? ? "https://www.nytimes.com/#{key['multimedia'][0]['url']}" : "https://placeimg.com/640/480/nature"
        e.content = key['snippet']
        e.source  = key['source']
        e.save
      end
    end
  end

end
