require 'faker'

FactoryGirl.define do
	factory :post do
		association :user
		# association :comments, factory: :post_comment
		price { Faker::Number.number(2).to_i }
		active { true }
		tag_list { Faker::Lorem.words }
		picture { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/bill.jpeg"), "image/jpeg") }
	end
end