class WeatherSerializer < ActiveModel::Serializer
  attributes :id, :location, :code, :date, :high, :low, :level
end
