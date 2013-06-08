class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?, :current_business, :business_logged_in?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	unless logged_in?
  		flash[:error] = "You must be logged in to do that"
  		redirect_to root_path
  	end
  end

  def current_business
    @current_business ||= Business.find(session[:business_id]) if session[:business_id]
  end

  def business_logged_in?
    !!current_business
  end

  def require_business
    unless business_logged_in?
      flash[:error] = "You must be logged in to do that"
      redirect_to root_path
    end
  end
end
