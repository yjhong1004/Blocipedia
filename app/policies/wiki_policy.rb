class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def create?
    user.admin? || user.premium? || user.standard?
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || @wiki.user == user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.nil? || user.standard?
        scope.where(private: [false, nil])
      elsif user.admin? || user.premium?
        scope.where(private: [false, nil, true])
      end
    end
  end

  def update?
    user.standard?
  end
end
