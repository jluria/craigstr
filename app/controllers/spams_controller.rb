class SpamsController < ApplicationController
  def create
    post = find_post
    Spam.create(user: current_user, post: post)
    redirect_to [post.region, post.category, post]
  end

  def destroy
    post = find_post
    spam = Spam.find_by(user: current_user, post: post)
    spam.destroy
    redirect_to [post.region, post.category, post]
  end

  private

  def find_post
    Post.find(params[:id])
  end
end
