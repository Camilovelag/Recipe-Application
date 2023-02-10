# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?
    can :manage, RecipeFood, user: user
    can :manage, Recipe, user: user
  end
end
