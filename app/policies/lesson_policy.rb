class LessonPolicy < ApplicationPolicy
  def show?
    @user.has_role?(:admin) || is_owner
  end

  def update?
    is_owner
  end

  def new?
    @user.has_role?(:teacher)
  end

  def edit?
    is_owner
  end

  def create?
    is_owner
  end

  def destroy?
    is_owner
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def is_owner
    @record.course.user == @user
  end
end
