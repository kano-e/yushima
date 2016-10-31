class ActivityComment
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

    def update?
      @user && (@user == @model.user || @user.role_admin?)
    end
  end
end

