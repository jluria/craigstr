class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Category.create(category_params)
    redirect_to category
  end

  def index
    @categories = Category.all
  end

  def show
    @category = find_category
  end

  def edit
    @category = find_category
  end

  def update
    category = find_category
    category.update(category_params)
    redirect_to category
  end

  def destroy
    find_category.destroy
    redirect_to categories_path
  end

  private

  def find_category
    Category.find_by(slug: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
