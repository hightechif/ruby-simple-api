module Api
  module V1
    class NewsController < ApplicationController
      before_action :set_news, only: [:show]
    
      def index
        @news = News.all
        if @news.exists?
          render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@news).as_json }
        else
          render status: 200, json: { status: :ok, results: [] }
        end
      end

      def show
        render status: 200, json: { status: :ok, results: ActiveModelSerializers::SerializableResource.new(@news).as_json }
      end

      def get_data
        News.fetch_api
        render status: 200, json: { status: :ok }
      rescue Exception => e
        render status: 500, json: { status: :error, errors: e }
      end

      private

      def set_news
        @news = News.find(params[:id])
      rescue Exception => e
        render status: 500, json: { status: :error, results: nil, errors: e }
      end
    
    end     
  end
end
