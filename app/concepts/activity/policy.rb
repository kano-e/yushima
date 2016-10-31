class Activity
  class Policy
    def initialize(user, model)
      @user, @model = user, model
    end

    def create?
      @user && (@user.role_member? || @user.role_admin?)
    end
  end
end
