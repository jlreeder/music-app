class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render text: "Success"
    else
      flash[:errors] = @user.errors.full_messages
      render text: "Failure"
    end
  end

  def show
    @user = User.find(params[:id])
    render text: @user.email
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
