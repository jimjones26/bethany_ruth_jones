FactoryGirl.define do
	factory :user do
		first_name				"Jimmy"
		last_name				"Jones"
		email					"foobar@foobar.com"
		password 				"foobar"
		password_confirmation	"foobar"
	end
end