class PostsController < ApplicationController
  
  def index
    posts = Post.order('id DESC')
    @posts = posts.page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def archives
    month = Chronic.parse(params[:archive_date].gsub("-", " "))
    posts = Post.order('id DESC').by_month(month)
    @posts = posts.page(params[:page]).per(10)
    render :index
  end

end
