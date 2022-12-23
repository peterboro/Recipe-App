class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public_recipe: true
    return unless user.present?

    can :read, :all if user.role == 'admin'
    can :manage, :all if user.role == 'admin'

    can :manage, Recipe, user_id: user.id
    can :manage, Inventory, user_id: user.id
    can :manage, InventoryFood, user_id: user.id
    can :manage, RecipesFood, user_id: user.id
    can :manage, Food, user_id: user.id

    can :read, :all if user.role == 'user'
    can :manage, :all if user.role == 'user'

    can :manage, Recipe, user_id: user.id
    can :manage, Inventory, user_id: user.id
    can :manage, InventoryFood, user_id: user.id
    can :manage, RecipesFood, user_id: user.id
    can :manage, Food, user_id: user.id
  end
end
