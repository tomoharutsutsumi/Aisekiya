class StatusesController < ApplicationController
  def index   
    @q = Status.ransack(params[:q])
    @statuses = @q.result
  end
end
