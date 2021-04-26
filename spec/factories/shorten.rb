FactoryGirl.define do
	factory :shorten do
		url { Faker::Internet.url }
	end
end