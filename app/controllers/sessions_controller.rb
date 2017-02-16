class SessionsController < ApplicationController
  def new; end

  def create
    email, password = session_params.values
    @user = User.find_by_credentials(email, password)
    if @user && @user.save
      render text: "Success"
    else
      render text: "Failure"
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
