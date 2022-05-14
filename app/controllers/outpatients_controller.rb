class OutpatientsController < ApplicationController

  def create
    @outpatient = Outpatient.new(outpatient_params)
    @user = @outpatient.user
    if @outpatient.save
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/users/#{@outpatient.user_id}"
    end
  end

  private
  def outpatient_params
    params.require(:outpatient).permit(:price, :text, :start_time).merge(user_id: params[:user_id])
  end
end
