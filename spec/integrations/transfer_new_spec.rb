require 'rails_helper'
RSpec.describe 'Category/new', type: :system do
  
  before(:each) do
    Category.destroy_all
    User.destroy_all
    @user = User.create(name: 'test', email: 'test@gmail.com', password: '123456', confirmed_at: Time.now)
    @category = @user.categories.create(name: 'Food', icon: 'fas fa-utensils')
    sign_in @user
  end
  describe 'The content of new page' do
    before(:each) do
        visit new_category_transfer_path(@category)
    end
    it 'displays the form heading for adding a new transfer' do
      expect(page).to have_selector('h2', text: 'Add New Transfer')
    end
    it 'displays the form for adding a new category' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Amount')
      expect(page).to have_selector('form select')
    end  
  end
  describe 'The links on the new page' do
    before(:each) do
        visit new_category_transfer_path(@category)
    end
    it 'shows the back link' do
      expect(page).to have_link(href: category_transfers_path(@category))
    end
    it 'shows the create category link' do
        expect(page).to have_link(href: category_transfers_path(@category))
    end
  end
end