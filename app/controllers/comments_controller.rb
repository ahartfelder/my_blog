class CommentsController < ApplicationController
  before_action :set_article
  def create
    if @article.comments.create(comment_params).valid?
      flash[:notice] = "The comment has been successfully posted!"
      redirect_to @article
    else
      render @article
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "The comment has been successfully deleted!"
    redirect_to @article
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
