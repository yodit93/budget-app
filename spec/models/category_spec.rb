require 'rails_helper'
describe Category do
  before(:all) do
    @category = Category.create(name: 'category', icon: 'icon')
  end

  it 'should name be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'should icon be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end
end