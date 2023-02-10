class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present?

    can :manage, RecipeFood, user: user
    can :manage, Recipe, user: user
  end
end
