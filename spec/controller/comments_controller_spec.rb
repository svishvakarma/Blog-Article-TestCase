require 'rails_helper'
RSpec.describe CommentsController, type: :controller do
  before(:each)  do
    @article = Article.create(name:"hjfd", body:"hjdhfj")
    @comment = Comment.create(body: "jdhfjd", article_id: @article.id)
  end 

  describe '#create' do
    it 'will create comment' do
      params = {
        comment: {
            article_id: @article.id, 
            body: "jdhfjdddk"
        }
      }
      post :create, params: params 
      expect(response).to have_http_status(302)
    end
  end

  describe "#show" do
    it 'will show a particular comment' do
    get :show, params: { article_id: @article.id, id: @comment.id } 
      expect(response).to have_http_status(302)
      # response.should redirect_to(article_path)#'/articles#show' #(article_path[@comment])

    end
  end

end
