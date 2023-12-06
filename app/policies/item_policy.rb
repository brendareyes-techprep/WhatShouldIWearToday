class ItemPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    user.present?
  end

end
