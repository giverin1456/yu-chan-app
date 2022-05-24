class OutpatientsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @outpatient = Outpatient.new
    @outpatients = Outpatient.where(user_id: @user.id)
    @first = @user.outpatients.order(start_time: :ASC).first
    @sales = Outpatient.group("MONTH(price)").sum(:price)

    # now = Date.today.month
    # @cccs = Outpatient.where("start_time <= ?", Time.now)
    # @ccc = Outpatient.where("start_time")
    # @now = Time.now
    # @dto = @now.ago(30.days)
    # @sdk = Outpatient.where("start_time >= ?", @dto)
    # @so = User.left_joins(:outpatients)
    # .where(outpatients: {user_id: @oaoa.user.id})
    # .where.not(outpatients: {user_id: @sdk.user.id })

        # @aaa = Outpatient.where(:start_time )

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
