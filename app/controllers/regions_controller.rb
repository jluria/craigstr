class RegionsController < ApplicationController
  before_filter :verify_admin, except: [:index, :show]

  def new
    @region = Region.new
  end

  def create
    region = Region.new(region_params)
    region.save
    redirect_to regions_path
  end

  def index
    @regions = Region.all
  end

  def show
    @region = find_region
    @categories = Category.all
  end

  def edit
    @region = find_region
  end

  def update
    region = find_region
    region.update(region_params)
    redirect_to region
  end

  def destroy
    region = find_region
    region.destroy
    redirect_to regions_path
  end

  private

  def find_region
    Region.find_by(slug: params[:id])
  end

  def region_params
    params.require(:region).permit(:name)
  end
end
