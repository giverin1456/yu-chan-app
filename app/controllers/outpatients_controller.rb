class OutpatientsController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :show, :create, :edit, :update]
  before_action :set_outpatient, only: [:index, :show, :edit, :update]

  def index
    @outpatient = Outpatient.new
    @outpatients = Outpatient.where(user_id: @user.id)

     # ハッシュとして全userそれぞれのpriceを取得できる→しかしハッシュのまま
    @sales = Outpatient.group(:user_id).sum(:price)
    @ttt = User.joins(:outpatients).group(:user_id).sum(:price)

    @month_record = @user.outpatients.group("MONTH(start_time)")


    now = Date.today.month
    @now = Time.now
    
    @cccs = Outpatient.where("start_time <= ?", @now)
    @ccc = Outpatient.where("start_time")

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
      redirect_to "/users/#{@outpatient.user_id}/outpatients"
    end
  end

  def show
    @outpatient = Outpatient.find(params[:id])
    @outpatients = Outpatient.where(user_id: @user.id)
  end

  def edit
    @outpatient = Outpatient.find(params[:id])
    @outpatients = Outpatient.where(user_id: @user.id)
  end

  def update
    @outpatient = Outpatient.find(params[:id])
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

  def set_outpatient
    @user = User.find(params[:user_id])
  end
end
