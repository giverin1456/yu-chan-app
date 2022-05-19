class OutpatientsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @outpatient = Outpatient.new
    @outpatients = Outpatient.where(user_id: @user.id)
    @first = @user.outpatients.order(:created_at).first
    @sales = Outpatient.group("MONTH(price)").sum(:price)

    now = Date.parse(params[:start_date])
    @ttt = now.all_month
    @aaa = Outpatient.where(start_date: @ttt)

    # @month = params[:month] ? Date.parse(params[:month]) : Time.zone.today
    # @orders = Outpatient.where(updated_at: @month.all_month)

    @ccc = Outpatient.where("updated_at <= ?", Time.now)
    # Time.now-30.day

  end

  def create
    @outpatient = Outpatient.new(outpatient_params)
    @user = @outpatient.user
    if @outpatient.save
      redirect_to "/users/#{@user.id}/outpatients"
    else
      redirect_to "/users/#{@outpatient.user_id}"
    end
  end

  def show
    @outpatient = Outpatient.find(params[:id])
    @user = User.find(params[:user_id])
    @outpatients = Outpatient.where(user_id: @user.id)
  end

  def edit
    @outpatient = Outpatient.find(params[:id])
    @user = User.find(params[:user_id])
    @outpatients = Outpatient.where(user_id: @user.id)
  end

  def update
    @outpatient = Outpatient.find(params[:id])
    @user = User.find(params[:user_id])
    if @outpatient.update(outpatient_params)
      redirect_to "/users/#{@user.id}/outpatients/#{@outpatient.id}"
    else
      redirect_to "/users/#{@user.id}/outpatients/#{@outpatient.id}/edit"
    end
  end

  def destroy
    @outpatient = Outpatient.find(params[:id])
    @user = @outpatient.user
    if @outpatient.destroy
      redirect_to "/users/#{@user.id}/outpatients"
    end
  end


  private
  def outpatient_params
    params.require(:outpatient).permit(:price, :text, :medical_category_id, :start_time).merge(user_id: params[:user_id])
  end
end
