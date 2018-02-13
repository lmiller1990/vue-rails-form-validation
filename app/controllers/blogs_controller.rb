class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show

  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save!
      render json: {}, status: :created
    else
      return :internal_server_error
    end
  end

  def new
    @blog = Blog.new(title: 'Title', body: '')
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :body)
  end
end
