class PostsController < ApplicationController

  def create
    post = Post.new(post_params)
    post.user = current_user
    post.save
    redirect_to dashboard_path
  end

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params) #we are calling the method below in the private section
      redirect_to dashboard_path
    else
      render:edit
    end
  end

  private

  def post_params
        params.require(:post).permit(:title, :content)
  end

end

