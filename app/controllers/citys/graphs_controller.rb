class Cities::GraphsController < ApplicationController
  def index   
    # @statuses = Status.all.group(:shop_name).map{ |s| [s.shop_name, [s.created_at, s.ratio.to_s]] }
  end
end