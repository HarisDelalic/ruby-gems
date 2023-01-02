class CoursePolicy < ApplicationPolicy
  def edit?
    @user.has_role?(:admin)
    @user.has_role?(:admin) || is_owner
  end

  def update?
    @user.has_role?(:admin) || is_owner
  end

  def new?
    @user.has_role?(:teacher)
  end

  def create?
    @user.has_role?(:teacher)
  end

  def destroy?
    @user.has_role?(:admin) || is_owner
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def is_owner
    @record.user = @user
  end
end
