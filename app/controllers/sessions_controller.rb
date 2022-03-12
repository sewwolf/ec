class SessionsController < ApplicationController
  skip_before_action :login_required
  before_action :set_user, only: [:create]

  def new; end

  def create
    if @user&.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def set_user
    @user = User.find_by(email: session_params[:email])
  rescue
    render :new
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
