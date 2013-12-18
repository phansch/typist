require 'spec_helper'

describe "User pages" do

  describe "profile page" do
    before do
      @user = FactoryGirl.create(:user)
      fill_signin_form
      # require 'pry'; binding.pry
    end

    context "after login" do
      it "should show the user profile" do
        visit '/user'
        expect(page).to have_content(@user.name)
        expect(page).to have_title(@user.name)
      end
    end

    context "with no completed lessons" do
      it do
        visit '/user'
        expect(page).to have_link('Start to learn touch-typing')
      end
    end

    context "with completed lessons" do
      before do
        FactoryGirl.create(:lesson)
        FactoryGirl.create_list(:practice, 10, user_id: @user.id, wpm: 15)
        visit user_path(@user) # reload page
      end
      it "is on the correct page" do
        expect(page).to have_content('WPM')
      end
    end
  end

  describe "signup page" do
    before { visit new_user_registration_path }

    it "is on the correct page" do
      expect(page).to have_content('Signup')
      expect(page).to have_title(full_title('Signup'))
    end
  end

  describe "signup" do

    before { visit new_user_registration_path }

    let(:submit) { "Sign up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar123"
        fill_in "Password confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before do
          click_button submit
          @user = User.find_by(email: 'user@example.com')
        end
        it do
          expect(page).to have_link('Sign out')
          expect(page).to have_selector('p.alert.alert-notice', text: 'Welcome!')
        end
      end

    end
  end
end

def fill_signin_form
  visit new_user_session_path
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => @user.password
  click_button 'Sign in'
end
