class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.present?
  end
  def new?
    @user.present?
  end
  def edit?
    @user.present?
  end
end
