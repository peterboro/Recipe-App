require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  subject do
    @user = User.create(name: 'Test User', role: 'admin', email: 'tests@gmail.com', password: '123456')
    @food = Food.create(name: 'Test Food', user_id: @user.id, measurement_unit: 'kilogram', price: 100)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a measurement unit' do
    subject.measurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a price less than 0' do
    subject.price = -1
    expect(subject).to_not be_valid
  end

  it 'is valid with a name, measurement unit, price, and user' do
    subject.name = 'Test Food'
    subject.measurement_unit = 'kilogram'
    subject.price = 100
    subject.user_id = @user.id
    expect(subject).to be_valid
  end
end
