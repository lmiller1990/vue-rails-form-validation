class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def create
    @blog = Blog.create(blog_params)
  end

  def new
    @blog = Blog.new(title: 'Title', body: '')
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
