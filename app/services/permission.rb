class Permission
  def initialize(user:, controller:, action:)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    # binding.pry
    if google_authenticated?
      return true if controller == "home" && action.in?(%w(index))
      return true if controller == "groups" && action.in?(%w(index show new create destroy edit update))
      return true if controller == "students" && action.in?(%w(show new create destroy edit update))
      return true if controller == "group_guardians_messages" && action.in?(%w(new create))
      return true if controller == "group_messages" && action.in?(%w(new create))
      return true if controller == "group_upload" && action.in?(%w(new create))
      return true if controller == "guardians" && action.in?(%w(new create show edit update destroy))
      return true if controller == "messages" && action.in?(%w(new create))
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
