
FactoryBot.define do
  factory :articles, class: 'Article' do
    name { "NewNmae" }
    body { "djklhadh" }
  end

  factory :comment, class: 'Comment', parent: :article do 
    body { "dkjfdkj" } 

     
  end 
end

