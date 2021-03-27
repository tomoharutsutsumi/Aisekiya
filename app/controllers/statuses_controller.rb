require 'open-uri'
class StatusesController < ApplicationController
  def index
    # Status.new.get_info      
    @q = Status.ransack(params[:q])
    @statuses = @q.result
  end
end
