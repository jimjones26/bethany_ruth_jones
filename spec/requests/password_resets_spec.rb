require 'spec_helper'

describe "password reset" do
	subject { page }

	describe "emails user when requesting password reset" do
		let(:user) { FactoryGirl.create(:user) }

		before do
			visit signin_path
			click_link('Click here to recover.')
			fill_in "Email", with: user.email
			click_button "Reset Password"
		end

		it { should have_title(full_title('')) }
		it { should have_selector('div.alert.alert-success', text: 'Success! An email has been sent with password reset instructions.') }

		it "should send email to user" do
			#last_email.should include(user.email)
			# ActionMailer::Base.deliveries.empty?.should be_false
			# ActionMailer::Base.deliveries.last.to.should == account.email
			# ActionMailer::Base.deliveries.last == user.email
		end
	end
end
