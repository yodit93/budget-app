require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before(:each) do
    @user = User.first
    @category = @user.categories.first
    sign_in @user
  end
  describe "GET /index" do
    before do
      get categories_path
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it 'renders categories/index template' do
      expect(response).to render_template(:index)
    end
    it "response body should include category info" do
      expect(response.body).to include(@category.icon)
      expect(response.body).to include(@category.name)
      expect(response.body).to include(@category.created_at.strftime("%d %B %Y"))
    end
    it "response body should include category transfers info" do
      expect(response.body).to include(@category.transfers.sum(:amount).to_s)
    end
  end
  describe "GET /new" do
    before do
      get new_category_path
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it 'renders categories/new template' do
      expect(response).to render_template(:new)
    end
    it "renders the new category form" do
      expect(response.body).to include("Add New Category")
      expect(response.body).to include('class="form-label"')
      expect(response.body).to include('class="form-control"')
      expect(response.body).to include('class="btn btn-secondary"')
      expect(response.body).to include('Create Category')
    end

  end
  describe "POST /create" do
    before do
      sign_in @user
      post categories_path, params: { category: { name: "Test Category", icon: "test-icon", author_id: @user.id } }
    end
    it "redirects to categories_path" do
      expect(response).to redirect_to(categories_path)
    end
    it "response body should include 'Category was successfully created.'" do
      follow_redirect!
      expect(response.body).to include("Category was successfully created.")
    end
  end
end
