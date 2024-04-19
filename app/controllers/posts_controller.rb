class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "post created."
      redirect_to root_path # Use redirect_to para redirecionar para a rota raiz
    else
      flash[:error] = "Error when registering post."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post atualizado com sucesso."
      redirect_to root_path
    else
      render :edit
    end
  end


  def edit
    @post = current_user.posts.find(params[:id])
  end

  def delete
  end

  private

  def post_params
    params.require(:post).permit(:id, :text, :tag, :logo)
  end
end