class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  MAX_LOGIN_ATTEMPTS = 6

  def create
    @authorised_user = User.authenticate_by(email: params[:user][:email].downcase, password: params[:user][:password])
    @user = User.find_by(email: params[:user][:email].downcase)

    if @authorised_user
      if @authorised_user.unconfirmed?
        redirect_to new_confirmation_path, warning: "Please confirm your email."
      else
        after_login_path = session[:user_return_to] || root_path
        @authorised_user.update(login_attempts: 0)
        active_session = login @authorised_user
        remember(active_session) if params[:user][:remember_me] == "1"
        redirect_to root_path, success: "Welcome back #{current_user.display_name || current_user.firstname.titlecase || ''} you are signed in."
      end
    elsif !@authorised_user && @user
      if @user.login_attempts > MAX_LOGIN_ATTEMPTS
        redirect_to root_path, error: "Account is locked.."
      else
        attempts = @user.login_attempts += 1
        @user.update(login_attempts: attempts)
        redirect_to root_path, error: "Incorrect email or password. Attempt: #{attempts}"
      end
    else
      redirect_to root_path, error: "Incorrect email or password. Attempt: #{attempts}"
    end
  end

  def destroy
    forget_active_session
    forget
    logout
    redirect_to root_path, success: "Successfully signed out."
  end

  def new
  end
end
