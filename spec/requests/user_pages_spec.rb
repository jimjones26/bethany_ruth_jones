require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "index" do
		before do
			sign_in FactoryGirl.create(:user)
			FactoryGirl.create(:user, first_name: "Bob", email: "bob@example.com")
			FactoryGirl.create(:user, first_name: "Ben", email: "ben@example.com")
			visit users_path
		end

		it { should have_title(full_title('All users')) }
		it { should have_content('All users') }

		it "should list each user" do
			User.all.each do |user|
				expect(page).to have_selector('td', text: user.first_name)
			end
		end
	end

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

	describe "edit" do
		let(:user) { FactoryGirl.create(:user) }
		before do
			sign_in user
			visit edit_user_path(user)
		end

		describe "page" do
			it { should have_content("Edit Account Details") }
			it { should have_title("Edit user") }
		end

		describe "with invalid information" do
			before { click_button "Save changes" }

			it { should have_content('error') }
		end

		describe "with valid information" do
			let(:new_first_name)  { "New First Name" }
			let(:new_email) { "new@example.com" }
			before do
				fill_in "user_first_name",       		with: new_first_name
				fill_in "user_email",            		with: new_email
				fill_in "user_password",         		with: user.password
				fill_in "user_password_confirmation", 	with: user.password
				click_button "Save changes"
			end

			it { should have_selector('div.alert.alert-success') }
			it { should have_link('Sign out', href: signout_path) }
			specify { expect(user.reload.first_name).to  eq new_first_name }
			specify { expect(user.reload.email).to eq new_email }
		end
	end
end