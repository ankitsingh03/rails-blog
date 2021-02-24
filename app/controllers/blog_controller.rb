class BlogController < ApplicationController
  before_action :authenticate_user!, except: [:home, :show]
  before_action :post_data, only: [:show, :edit, :update, :destroy]

  def home
    @posts = Post.all.reverse_order
  end

  def index
    @posts = Post.where(user_id:current_user.id).reverse_order
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(title: params[:title], body: params[:body], user_id: params[:user_id])
    @post = Post.new(post_params)

    if @post.save
      redirect_to blog_path(@post)
    else
      render :new
    end
  end

  def edit
    if current_user.id == @post.user_id
      @post
    else
      redirect_to blog_path(@post)
    end
  end

  def update
    if @post.update(post_params)
      redirect_to blog_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

    def post_data
      @post = Post.find(params[:id])
    end
end
