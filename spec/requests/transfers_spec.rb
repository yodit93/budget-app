require 'rails_helper'

RSpec.describe "Transfers", type: :request do
  before(:each) do
    @user = User.first
    sign_in @user
    @category = @user.categories.create(name: 'Test Category', icon: 'test-icon')
    @transfer = Transfer.create(name: 'transfer-test', amount: 100, author: @user)
    CategoryTransfer.create(category: @category, transfer: @transfer)
    @transfers = @category.transfers.all
   
  end
  describe "GET /index" do
    before(:each) do
      get category_transfers_path(@category)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'should include "Transfers" text' do
      expect(response.body).to include('Transfers')
    end
    it 'should include back arrow' do
      expect(response.body).to include('class="fa fa-arrow-left text-light back-arrow"')
    end
    it 'should show category name and icon' do
      expect(response.body).to include(@category.name)
      expect(response.body).to include(@category.icon)
    end
    it 'should list transfer' do
      expect(response.body).to include(@transfers[0].name)
    end
    it 'should include transfer date' do
      expect(response.body).to include(@transfers[0].created_at.strftime("%d %B %Y at %l:%M %P"))
    end
    it 'should include "New Transfer" button' do
      expect(response.body).to include('New Transfer')
    end
    
  end
  describe "GET /new" do
    before(:each) do
      get new_category_transfer_path(@category)
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
    it 'should include back arrow' do
      expect(response.body).to include('class="fa fa-arrow-left text-dark back-arrow"')
    end
    it 'should include "New Transfer" text' do
      expect(response.body).to include('Add New Transfer')
    end
    it 'should include "Name" text' do
      expect(response.body).to include('Name')
    end
    it 'should include "Amount" text' do
      expect(response.body).to include('Amount')
    end
    it 'should include "Category" text' do
      expect(response.body).to include('Category')
    end
    it 'should include "Create Transfer" button' do
      expect(response.body).to include('Create Transfer')
    end
  end
  describe "POST /create" do
    before(:each) do
      post category_transfers_path(@category), params: { transfer: { name: 'test-transfer', amount: 100, author_id: @user.id} }
    end
    it 'redirects to category_transfers_path' do
      expect(response).to redirect_to(category_transfers_path(@category))
    end
    it 'response body should include "Transfer was successfully created."' do
      follow_redirect!
      expect(response.body).to include('Transfer was successfully created.')
    end
  end
end
