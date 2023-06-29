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


  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.update(comments_params)
    redirect_to @article 
  end

  private

  def comments_params
    params.require(:comment).permit(:id, :body) 
  end
end
