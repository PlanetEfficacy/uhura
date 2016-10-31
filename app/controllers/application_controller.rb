class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authorize!

  helper_method :current_user

  # def authorize!
  #   unless current_permission.authorized?
  #     redirect_to login_path
  #   end
  # end
  #
  # def current_permission
  #   Permission.new( user: current_user,
  #                   controller: params[:controller],
  #                   action: params[:action] )
  # end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
