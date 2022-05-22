class AdminsController < ApplicationController
  def show
  end

  def edit
    @admin = current_admin
  end

  def update
    @admin = Admin.find(params[:id])
    
    if @admin.update(admin_params)
      redirect_to root_path
    else
      render :edit
    end
  end

    private
    def admin_params
      params.require(:admin).permit(:name, :email)
    end
  end
