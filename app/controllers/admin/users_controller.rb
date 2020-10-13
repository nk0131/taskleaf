class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:back].present?
      render :new
      return
    end
    
    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}を登録しました。」"
    else
      render :new
    end
  end

  def confirm_new
    @user = User.new(user_params)
    render :new unless @user.valid?
  end



  def update
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}を更新しました。」"
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  
  

  
  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to  root_path unless current_user.admin?
  end
end
