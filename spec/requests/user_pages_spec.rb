require 'spec_helper'

describe "User pages" do
	subject { page }

	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h3', text: 'Create New Account') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }

		it { should have_content(user.first_name) }
		it { should have_title(full_title('View User Profile')) }
	end

	describe "signup" do
		before { visit signup_path }

		let (:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end

			describe "after submission" do
				before { click_button submit }

				it { should have_title('Sign up') }
				it { should have_selector('div.alert.alert-danger') }
			end
		end

		describe "with valid information" do
			before do
				fill_in "user_first_name",				with: "Example"
				fill_in "user_last_name",				with: "User"
				fill_in "user_email",					with: "user@example.com"
				fill_in "user_password",				with: "foobar"
				fill_in "user_password_confirmation",	with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

			describe "after saving the user" do
				before { click_button submit }
				let(:user) { User.find_by(email: 'user@example.com') }

				it { should have_link('Sign out') }
				it { should have_title(full_title('View User Profile')) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome to the Team Awesome training section!') }
			end
		end
	end

end