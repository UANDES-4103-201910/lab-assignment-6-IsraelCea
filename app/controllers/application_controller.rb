class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  def current_user
    @_current_user ||= session[:current_user_id] and User.find(id: session[:current_user_id])
  end


  def is_user_logged_in?
    #complete this method
    logged_in = false
    if session[:current_user]
      then logged_in = true
    else
      redirect_to root_url
    end
  end

end

