require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    @user = User.create(name: 'Test User', role: 'admin', email: 'tests@gmail.com', password: '123456')
    @recipe = Recipe.create(name: 'Test Recipe', user_id: @user.id, description: 'Test Description', preparation_time: 10, cooking_time: 10)
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a preparation_time' do
    subject.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a cooking_time' do
    subject.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid with a name, description, preparation_time, cooking_time, and user' do
    subject.name = 'Test Recipe'
    subject.description = 'Test Description'
    subject.preparation_time = 10
    subject.cooking_time = 10
    subject.user_id = @user.id
    expect(subject).to be_valid
  end
end
