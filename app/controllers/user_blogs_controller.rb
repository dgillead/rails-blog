class UserBlogsController < ApplicationController
  before_action :user_signed_in?, only: [:new, :create]
  before_action :find_blog, only: [:show]

  def new
    @blog = UserBlog.new
  end

  def create
    @blog = UserBlog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  def show
  end

  private

  def blog_params
    params.require(:user_blog).permit(:title, :category, :description)
  end

  def find_blog
    @blog = UserBlog.find_by(id: params[:id])
  end
end
