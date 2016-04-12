class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
    # Implement Strong Params
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end