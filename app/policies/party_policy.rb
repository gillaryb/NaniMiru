class PartyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    # record.users.include? user
    true
  end

  def create?
    true
  end
end
