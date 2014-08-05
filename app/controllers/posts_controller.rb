class PostsController < ApplicationController

	def create
	  post = Post.new(post_params)
	  post.user = current_user
	  post.save
	  redirect_to dashboard_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

end
