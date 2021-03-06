class UsersController < ApplicationController
  before_action :authenticate_admin!, only: [:index, :new, :show, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    # @users = User.all.order("name")
    @sss = Outpatient.order(created_at: :desc).first
    @users = User.search(params[:keyword])
    @item = @users.page(params[:page]).per(15)

    # now = Time.now.strftime('%Y%m%d').to_i
    # birthday = @item.birthday.strftime('%Y%m%d').to_i
    # @age = (now - birthday)/10000

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

  def show
    @user = User.find(params[:id])
    @abc = Somatic.where(user_id: @user.id)

    @first = @user.outpatients.order(start_time: :ASC).first
    @last = @user.outpatients.order(start_time: :ASC).last

    now = Time.now.strftime('%Y%m%d').to_i
    birthday = @user.birthday.strftime('%Y%m%d').to_i
    @age = (now - birthday)/10000

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @users = User.search(params[:keyword])
    @item = @users.page(params[:page]).per(15)
  end

  private
  def user_params
    params.require(:user).permit(:name, :kana, :gender_id, :phone_number, :postal_code, :prefecture_id, :city, :street, :building, :know_id, :email, :birthday, :text, :medical_history, :contraindication, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end