class CoursePolicy < ApplicationPolicy
  def edit?
    @user.has_role?(:admin)
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
