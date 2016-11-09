class Permission
  def initialize(user:, controller:, action:)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    if google_authenticated?
      return true if controller == "groups" && action.in?(%w(index show new create destroy edit update))
    else
      return true if controller == "home" && action.in?(%w(index))
    end
    false
  end

  private
    attr_reader :user,
                :controller,
                :action

    def google_authenticated?
      !user.token.nil?
    end
end
