class UserBlogsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update, :destroy]

  def index
    @user_blogs = UserBlog.all
  end

  def new
    @user_blog = UserBlog.new
  end

  def create
    @user_blog = UserBlog.new(user_blog_params)
    if @user_blog.save
      redirect_to @user_blog
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @user_blog.destroy
    redirect_to '/user_blogs'
  end

  def update
    if @user_blog.update_attributes(user_blog_params)
      redirect_to @user_blog
    else
      render :edit
    end
  end

  private

  def user_blog_params
    params.require(:user_blog).permit(:title, :category, :description)
  end

  def find_blog
    @user_blog = UserBlog.find_by(id: params[:id])
  end
end
