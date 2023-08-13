class HomeController < ApplicationController
  def index
  	render json: { status: :success, result: "Mother Earth initial landing", errors: nil }
  end
end
