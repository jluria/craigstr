class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    category = Catergory.new(category_params)
    category.save
    redirect to category_path
  end

  def index
    @categories = Catergory.all
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
    category = find_category
    category.destroy
    redirect_to category_path
  end

  private

  def find_category
    Category.find_by(name: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
