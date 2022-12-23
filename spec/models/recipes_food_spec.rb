require 'rails_helper'

RSpec.describe RecipesFood, type: :model do
  subject do
    @user = User.create(name: 'Test User', role: 'admin', email: 'tests@gmail.com', password: '123456')
    @recipe = Recipe.create(name: 'Test Recipe', user_id: @user.id, description: 'Test Description',
                            preparation_time: 10, cooking_time: 10)
    @food = Food.create(name: 'Test Food', measurement_unit: 'kilogram', price: 100, user_id: @user.id)
    @recipes_food = RecipesFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 10)
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with a quantity, food, and recipe' do
    subject.quantity = 10
    subject.food_id = @food.id
    subject.recipe_id = @recipe.id
    expect(subject).to be_valid
  end
end
