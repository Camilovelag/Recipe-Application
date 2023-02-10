# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :create, RecipeFood, user: user
    can :destroy, RecipeFood, user: user
    can :update, RecipeFood, user: user
  end
end
