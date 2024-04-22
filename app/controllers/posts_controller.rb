class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).page params[:page]
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "post created."
      redirect_to root_path
    else
      flash[:error] = "Error when registering post."
      render :new
    end
  end

  def show
    @post = current_user.posts.find(params[:id])
    @comment = @post.comments
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post atualizado com sucesso."
      redirect_to root_path
    else
      flash[:error] = "Post não atualizado."
      render :edit
    end
  end


  def edit
    @post = current_user.posts.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'Post excluído com sucesso.'
  end

  private

  def post_params
    params.require(:post).permit(:id, :text, :tag, :foto)
  end
end