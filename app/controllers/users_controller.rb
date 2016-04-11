class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
        flash[:success] = 'You are registered!'
        redirect_to user_path user.id
    else
        flash[:error] = 'Registration has failed!'
        redirect_to new_user_path
    end
 end

  def new
  end

  def update
  end

  def show
  end
end
