class DashboardsController < ApplicationController
  def show
    @post = Post.new
    @spam = Spam.all
  end
end
