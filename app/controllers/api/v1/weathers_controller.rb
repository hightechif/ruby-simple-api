module Api
  module V1
    class WeathersController < ApplicationController
      before_action :set_weather, only: [:show]
      before_action :set_city, only: [:get_weather_per_city]
    
      def index
        @weather = Weather.all
        if @weather.exists?
          render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@weather).as_json }
        else
          render status: 200, json: { status: :ok, results: [] }
        end
      end

      def show
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@weather).as_json }
      end

      def get_weather_per_city
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@weather).as_json }
      end

      def get_data
        @cityweather = Weather.fetch_api
        render status: 200, json: { status: :ok, results: { city: @cityweather } }
      rescue Exception => e
        render status: 500, json: { status: :error, errors: e }
      end

      private

      def set_weather
        @weather = Weather.find(params[:id])
      rescue Exception => e
        render status: 500, json: { status: :error, results: nil, errors: e }
      end

      def set_city
        @weather = Weather.where(location: params[:location].humanize)
      rescue Exception => e
        render status: 500, json: { status: :error, results: nil, errors: e }
      end

    end
  end
end
