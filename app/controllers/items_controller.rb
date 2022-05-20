class ItemsController < ApplicationController
  def index
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Date.today.month
  end
end
