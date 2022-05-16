class SomaticsController < ApplicationController

  def new
    @somatic = Somatic.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @somatic = Somatic.new(somatic_params)
    if @somatic.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def somatic_params
    params.require(:somatic).permit(:images).merge(user_id: @user.id)
  end
end
