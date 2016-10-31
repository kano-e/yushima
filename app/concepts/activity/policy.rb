class Activity
  class Policy
    def initialize(user, model)
      @user, @model = user, model
    end

    def show?
      true
    end

    def create?
      @user && (@user.role_member? || @user.role_admin?)
    end

    alias_method :update?, :create?
  end
end
