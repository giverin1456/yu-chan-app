class ItemsController < ApplicationController
  def index
    @admin = current_admin
    @now = Date.today.month
    @outpatient = Outpatient.all.order(start_time: :DESC)
    @item = @outpatient.page(params[:page]).per(15)

    
    @reserve = Item.all.where(day: Date.current).order("time")
    # now = Time.current
    # @bbb = now.ago(1.days).strftime("%Y-%m-%d")
  end

  def new
    @reservation = Item.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")

    message = Item.check_reservation_day(@day.to_date)
    if !!message
      redirect_to @reservation, flash: { alert: message }
    end
  end

  def show
    @reservation = Item.find(params[:id])
  end

  def create
    
    @reservation = Item.new(reservation_params)
    if @reservation.save
      redirect_to item_path @reservation.id
    else
      render :new
    end

  end


  def information
    @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    @orders = User.where(created_at: @month.all_month)
    @now = Time.now.strftime('%Y%m%d')
  end

  def reservation
    @reservations = Item.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  private
  def reservation_params
    params.require(:item).permit(:day, :time, :start_time, :user_id)
  end
end
