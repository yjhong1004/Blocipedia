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
       wikis = []
       if user.role == 'admin'
         wikis = scope.all
       elsif user.role == 'premium'
          scope.where(private: [false, nil] || wiki.owner == user || wiki.collaborators.include?(user))
       elsif user.role == 'standard'
         scope.where(private: [false, nil] || wiki.collaborators.include?(user))
       else
         scope.where(private: [false, nil])
       end
     end
   end

end
