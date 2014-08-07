class PostsController < ApplicationController
  before_filter :require_login, except: [:show]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @region = find_region
    @category = find_category
  end

  def create
    post = current_user.posts.new(post_params)
    post.region = find_region
    post.category = find_category
    post.save
    redirect_to [post.region, post.category, post]
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to [post.region, post.category, post]
    else
      render :edit
    end
  end

  private

  def find_category
    Category.find_by(slug: params[:category_id])
  end

  def find_region
    Region.find_by(slug: params[:region_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
