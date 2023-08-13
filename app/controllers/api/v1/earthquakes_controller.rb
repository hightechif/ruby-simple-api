module Api
  module V1
    class EarthquakesController < ApplicationController
      before_action :set_earthquake, only: [:show]

      def index
        @earthquakes = Earthquake.all
        if @earthquakes.exists?
          render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@earthquakes).as_json }
        else
          render status: 200, json: { status: :ok, results: [] }
        end
      end

      def show
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@earthquake).as_json }
      end

      def get_more_data
        @earthquakes_more = Earthquake.where('magnitude > 5.0')
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@earthquakes_more).as_json }
      end

      def get_less_data
        @earthquakes_less = Earthquake.where('magnitude < 5.0')
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@earthquakes_less).as_json }
      end

      def get_data
        Earthquake.fetch_xml
        render status: 200, json: { status: :ok }
      rescue Exception => e
        render status: 500, json: { status: :error, errors: e }
      end

      private

      def set_earthquake
        @earthquake = Earthquake.find(params[:id])
      rescue Exception => e
        render status: 500, json: { status: :error, results: nil, errors: e }
      end
      
    end
  end
end
