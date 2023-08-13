require 'net/http'
require 'active_support/core_ext/hash' #convert xml to json
require 'date'

class Earthquake < ApplicationRecord

	def self.fetch_xml
		url = 'http://data.bmkg.go.id/gempadirasakan.xml'
    uri = URI(url)
    getdata = Net::HTTP.get(uri)
    @data = JSON.parse(Hash.from_xml(getdata).to_json)

    @data['Infogempa']['Gempa'].each do |key, value|
      datetime = key['Tanggal']
      position = key['Posisi']
      split_posisi = position.split(' ')
      latitude = split_posisi[0] + ' ' + split_posisi[1]
      longitude = split_posisi[2] + ' ' + split_posisi[3]
      magnitude = key['Magnitude']
      depth = key['Kedalaman']
      location = key['Keterangan'].strip

      @earthquake = Earthquake.find_or_create_by(earthquake_time: self.str_to_date(datetime)) do |e|
      	e.latitude = latitude
      	e.longitude = longitude
      	e.magnitude = magnitude
      	e.depth = depth
      	e.location = location
      	e.save
      end
    end
	end

	def self.str_to_date str
		date, tz = str.split(' ')
		ntz = case tz
		when 'WIB'
			'+0700'
		when 'WITA'
			'+0800'
		when 'WIT'
			'+0900'
		end

		ndate = [date, ntz].join('')

		DateTime.strptime(ndate, "%d/%m/%Y-%H:%M:%S%z")
	end
end
