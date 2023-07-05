require 'rails_helper'
RSpec.describe 'Category/new', type: :system do
  
  before(:each) do
    User.destroy_all
    @user = User.create(name: 'test', email: 'test@gmail.com', password: '123456', confirmed_at: Time.now)
    sign_in @user
  end
  describe 'The content of new page' do
    before(:each) do
        visit new_category_path
    end
    it 'displays the form heading for adding a new category' do
      expect(page).to have_selector('h2', text: 'Add New Category')
    end
    it 'displays the form for adding a new category' do
      expect(page).to have_field('Name')
      expect(page).to have_field('Icon')
    end  
  end
  describe 'The links on the new page' do
    before(:each) do
        visit new_category_path
    end
    it 'shows the back link' do
      expect(page).to have_link(href: categories_path)
    end
    it 'shows the create category link' do
        expect(page).to have_link(href: categories_path)
    end
  end
end