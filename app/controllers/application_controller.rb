class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize!

  helper_method :current_user, :contact_params

  def authorize!
    unless current_permission.authorized?
      redirect_to root_path
    end
  end

  def current_permission
    Permission.new( user: current_user,
                    controller: params[:controller],
                    action: params[:action] )
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def contact_params
    params.require(:contact).permit(:phone_number) if params[:contact]
  end
end
