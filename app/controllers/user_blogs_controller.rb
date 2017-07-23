class UserBlogsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update]

  def index
    @blogs = UserBlog.all
  end

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

  def edit
  end

  def update
    if @blog.update_attributes(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  private

  def blog_params
    params.require(:user_blog).permit(:title, :category, :description)
  end

  def find_blog
    @blog = UserBlog.find_by(id: params[:id])
  end
end
