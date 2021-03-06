class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = 'ユーザー登録完了'
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end
  
  private
  def users_params
    params.require(:user).permit(:name,:email, :password)
  end
  
end
