class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @category_questions = @category.questions.paginate(page: params[:page], per_page: 12)
  end
end
