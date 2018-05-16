class PostsController < ApplicationController

#ユーザー（サロン側）が旅行計画を投稿する機能です。

before_action :logged_in_user, only: [:new, :create, :edit, :update]
before_action :correct_user, only: [:edit, :update]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to posts_path , notice: 'successfully posted'
    else
      flash.now[:alert] = 'failed'
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
   @post = Post.find_by(id: params[:id])
   if @post.update(content:  params[:content])
     flash[:notice] = "Your comment has been updated."
    redirect_to posts_path
   else
    redirect_to edit_post_path(@post.id)
  end
 end

 def destroy
   @post = Post.find_by(id: params[:id])
   if @post.present?
   @post.destroy
    flash[:notice] = "Your comment has been deleted."
   redirect_to posts_path
   else
   redirect_to root_path
 end
 end

 private
  def post_params
    params.require(:post).permit(:job,:place,:start_date,:end_date,:content)
  end
end
