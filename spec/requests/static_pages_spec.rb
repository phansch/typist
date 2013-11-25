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

  describe "Learn page" do
    it "should have the content 'Learn'" do
      visit '/learn'
      expect(page).to have_content('Learn')
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    first(:link, "About").click
    expect(page).to have_title(full_title('About'))
    click_link "Help"
    expect(page).to have_title(full_title('Help'))
    click_link "Home"
    click_link "Try it out"
    expect(page).to have_title(full_title('Learn'))
    click_link "Signup"
    expect(page).to have_title(full_title('Signup'))
  end
end