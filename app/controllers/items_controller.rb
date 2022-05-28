class ItemsController < ApplicationController
  def index
    @admin = current_admin
    @now = Date.today.month
    @outpatient = Outpatient.all.order(start_time: :DESC)

    @item = @outpatient.page(params[:page]).per(15)
  end

  def information
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Time.now.strftime('%Y%m%d')
    
  end
end
