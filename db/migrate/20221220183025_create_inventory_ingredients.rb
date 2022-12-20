class CreateInventoryIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_ingredients do |t|
      t.references :inventory, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.integer :quantity
      t.string :unit

      t.timestamps
    end
  end
end
