class ApplicationController < ActionController::Base
  require 'pry'
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      @current_user = User.find_by_id(session[:user_id])
    end
  end


  def logged_in?
    !!current_user
  end
  
  private 

  def require_login
     redirect_to root_path  unless session.include? :user_id 
  end


end
