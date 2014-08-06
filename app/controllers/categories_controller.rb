class CategoriesController < ApplicationController
  before_filter :verify_admin, except: [:show]

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    redirect_to categories_path
  end

  def index
    @categories = Category.all
  end

  def show
    @region = find_region
    @category = find_category
  end

  def edit
    @category = find_category
  end

  def update
    category = find_category
    category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    find_category.destroy
    redirect_to categories_path
  end

  private

  def find_region
    Region.find_by(name: params[:region_id])
  end

  def find_category
    Category.find_by(slug: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
