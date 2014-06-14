require 'faker'

FactoryGirl.define do
	factory :offer do
		association :user
		association :post
		amount { Faker::Number.number(3).to_i }
	end
end