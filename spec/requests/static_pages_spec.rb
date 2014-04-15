require 'spec_helper'

describe "Static pages" do

	describe "Home page" do

		it "should have the right title" do
			visit '/static_pages/home'
			expect(page).to have_title("BethanyRuthJones.com | Home")
		end

		it "should have the content 'Bethany Ruth Jones'" do
			visit '/static_pages/home'
			expect(page).to have_content('Bethany Ruth Jones')
		end

		it "should have the content 'Coming Soon'" do
			visit '/static_pages/home'
			expect(page).to have_content('Coming Soon')
		end

		it "should have email address 'bethanyruthjones@gmail.com" do
			visit '/static_pages/home'
			expect(page).to have_selector('a', text: 'bethanyruthjones@gmail.com')
		end
	end
end