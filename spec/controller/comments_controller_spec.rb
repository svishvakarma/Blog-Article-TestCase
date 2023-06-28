require 'rails_helper'
RSpec.describe CommentsController, type: :controller do
  before(:each)  do
    @article = Article.create(name:"hjfd", body:"hjdhfj")
    @comment = Comment.create(body: "jdhfjd")
  end 

end
