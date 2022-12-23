require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  subject do
    @user = User.create(name: 'Test User', role: 'admin', email: 'tests@gmail.com', password: '123456')
    @inventory = Inventory.create(name: 'Test Inventory', user_id: @user.id, description: 'Test Description')
    @food = Food.create(name: 'Test Food', measurement_unit: 'kilogram', price: 100, user_id: @user.id)
    @inventory_food = InventoryFood.create(inventory_id: @inventory.id, food_id: @food.id, quantity: 10)
  end

  it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an inventory' do
    subject.inventory_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with a quantity, food, and inventory' do
    subject.quantity = 10
    subject.food_id = @food.id
    subject.inventory_id = @inventory.id
    expect(subject).to be_valid
  end
end