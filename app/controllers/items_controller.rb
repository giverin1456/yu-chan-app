class ItemsController < ApplicationController
  def index
    @admin = current_admin
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Date.today.month
  end
end
