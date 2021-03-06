class SessionsController < ApplicationController
  def new; end

  def create
    email, password = session_params.values
    @user = User.find_by_credentials(email, password)
    if @user && @user.save
      log_in!(@user)
      redirect_to user_url(@user)
    else
      render text: "Failure"
    end
  end

  def destroy
    log_out!(current_user)
    render text: "Success"
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
