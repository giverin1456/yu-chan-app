class UsersController < ApplicationController
  def index
    @users = User.order("created_at DESC")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :kana, :gender_id, :phone_number, :postal_code, :prefecture_id, :city, :street, :building, :know_id, :email, :birthday)
  end
end
