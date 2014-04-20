FactoryGirl.define do
	sequence :email do |n|
		"foo#{n}@example.com"
	end
	factory :user do
		first_name				"Test"
		last_name				"User"
		email
		password 				"foobar"
		password_confirmation	"foobar"
	end
end