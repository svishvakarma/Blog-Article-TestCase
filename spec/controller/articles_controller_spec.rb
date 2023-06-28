require 'rails_helper'
RSpec.describe ArticlesController, type: :controller do
  let(:article) { FactoryBot.create(:article) }

  describe "#index" do
    it "show all article" do
      get :index
      expect(response).to have_http_status :ok
    end
  end

  describe '#create' do
    it 'will create article' do
      params = {
        article: {
            name: "John Doe",
            body: "jdhfjdddk",
        }
      }
      post :create, params: params
      expect(response).to have_http_status(302)
    end
  end

  describe "#show" do
    it 'will show a particular article' do
      get :show, params: { id: article.id}
      expect(response).to have_http_status(200)
    end
  end


  describe "#update " do
    it 'will update a request' do
      put :update, params: { id: article.id, "article": { "name": "jhjdjd", "body": "kdjkkd" }}
      expect(response).to have_http_status(302)
    end
  end

  describe "#destroy" do
    it "destroys article and returns success message" do
      delete :destroy, params: { id: article.id }
      expect(response).to have_http_status(204)  #200 
    end
  end

end
