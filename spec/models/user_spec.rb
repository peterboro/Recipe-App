require 'rails_helper'
require 'capybara/rspec'

Capybara.default_driver = :selenium

RSpec.describe User, type: :model do
  subject { User.create(name: 'Test User', role: 'admin') }

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a role' do
    subject.role = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with a role other than admin or user' do
    subject.role = 'invalid'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
