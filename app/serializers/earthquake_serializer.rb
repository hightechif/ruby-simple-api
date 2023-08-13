class EarthquakeSerializer < ActiveModel::Serializer
  attributes :id, :earthquake_time, :latitude, :longitude, :magnitude, :depth, :location

  def earthquake_time
  	object.earthquake_time.to_datetime
  end
end
