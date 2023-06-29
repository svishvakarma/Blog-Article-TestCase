class CommentsController < ApplicationController
 
  def show
    @article = Article.find(params[:article_id])
    @comment = @article.comments 
    redirect_to @article

  end

  def new
    @article = Article.find(params[:comment][:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:comment][:article_id])
    @comment = @article.comments.new(comments_params) 
      if @comment.save
        redirect_to @article
      else
        render :new, status: unprocessable_entity
      end
  end

  private

  def comments_params
    params.permit(:id, :body) 
  end
end
