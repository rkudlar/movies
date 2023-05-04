class MoviePolicy < ApplicationPolicy
  private

  def allowed?
    record.user == user
  end
end
