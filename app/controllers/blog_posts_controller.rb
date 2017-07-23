class BlogPostsController < ApplicationController
  before_action :find_blog, only: [:new, :create, :show]
  before_action :find_blog_post, only: [:show]

  def new
    @blog_post = @user_blog.blog_posts.new
  end

  def create
    @blog_post = @user_blog.blog_posts.new(blog_post_params)
    if @blog_post.save!
      redirect_to user_blog_blog_post_path(@user_blog, @blog_post)
    else
      render :new
    end
  end

  def show
  end

  private

  def find_blog
    @user_blog = UserBlog.find_by(id: params[:user_blog_id])
  end

  def find_blog_post
    @blog_post = BlogPost.find_by(id: params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :date_posted, :blog_text)
  end
end
