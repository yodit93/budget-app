class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    def new
        @category = Category.new
    end
    def create
        @category = current_user.categories.new(category_params)
        if @category.save
            flash[:notice] = "Category was successfully created."
            redirect_to categories_path
        else
            render :new
        end
    end
    private
    def category_params
        params.require(:category).permit(:name, :icon, :author_id)
    end
end
