class InventoryIngredient < ApplicationRecord
  belongs_to :inventory
  belongs_to :ingredient
end
