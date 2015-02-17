class SubcategoriesController < ApplicationController

  def show
  end

  def find_by_category
    category = Category.find params[:category_id]
    subcategies = category.subcategories.find_all
    render json: {subcategories: subcategies}
  end

end