require 'faker'

FactoryGirl.define do
	factory :post do
		price { Faker::Number.number(2).to_i }
		active { true }
		tag_list { Faker::Lorem.words }
		picture { Faker::Lorem.characters(10) }
	end
end