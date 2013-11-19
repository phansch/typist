require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Typist'" do
      visit '/'
      expect(page).to have_content('Typist')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do
    it "should have the content 'About'" do
      visit '/about'
      expect(page).to have_content('About')
    end
  end
end