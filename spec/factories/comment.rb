require 'faker'

FactoryGirl.define do
  factory :post_comment, class: "Comment" do
    association :commentable, :factory => :post
  	association :user
  	association :post
  	text { Faker::Lorem.sentence(3) }
  end
end