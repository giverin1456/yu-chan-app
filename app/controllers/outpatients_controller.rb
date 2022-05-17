class OutpatientsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @outpatient = Outpatient.new
    @outpatients = Outpatient.where(user_id: @user.id)
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
    params.require(:outpatient).permit(:price, :text, :start_time).merge(user_id: params[:user_id])
  end
end
