class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if current_user.present?
      @comment.user_id = current_user.id
    end
    if @comment.save
      redirect_to root_path, notice: "Comment added successfully."
    else
      flash[:error] = "Error when registering comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :text)
  end
end
