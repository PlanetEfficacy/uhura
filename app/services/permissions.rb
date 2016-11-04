class Permission
  def initialize(user:, controller:, action:)
    @user = user || User.new
    @controller = controller
    @action = action
  end

  def authorized?
    if user.teacher?
      return true if controller = "classes" && action.in?(%w(index))
    end
    false
  end

  private
    attr_reader :user,
                :controller,
                :action
end
