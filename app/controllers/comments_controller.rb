class CommentsController < ApplicationController
 
		def show
			@article = Article.find(params[:article_id])
			@comment = @article.comments 
		end
	
	  def new
			@article = Article.find(params[:article_id])
			@comment = @article.comments.new
		end

		def create
			@article = Article.find(params[:article_id])
			@comment = @article.comments.new(comments_params) 
				if @comment.save
					redirect_to @article
				else
					render :new, status: unprocessable_entity
				end
		end

		private

		def comments_params
			params.require(:comment).permit(:id, :body) 
		end
end
