require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

		it "should have the base title" do
			visit '/home'
			expect(page).to have_title("Bethany Ruth Jones")
		end

		it "should not have a custom page title" do
			visit '/home'
			expect(page).not_to have_title('| Home')
		end

	end
end