class CitiesController < ApplicationController
  def index   
    @q = City.ransack(params[:q])
    @cities = @q.result.includes(:statuses).order("statuses.id ASC")
  end
end
