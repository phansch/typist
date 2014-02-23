require 'spec_helper'

describe UsersHelper do

  before do
    @user = FactoryGirl.create(:user)
  end

  describe "#gravatar_for" do
    it "should return the gravatar image for the given user" do
      expect(gravatar_for(@user)).to eq(gravatar_img)
    end
  end

  describe "#avarage_wpm_for" do
    before do
      FactoryGirl.create_list(:practice, 10, wpm: 15)
    end

    it "should return the average wpm for the last 10 practices" do
      expect(average_wpm_for(@user)).to eq 15
    end
  end
end


private

  def gravatar_img
    gravatar_id = Digest::MD5::hexdigest(@user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    img = "<img alt=\"#{@user.name}\" class=\"gravatar img-rounded\" data-placement=\"bottom\" rel=\"tooltip\" src=\"#{gravatar_url}&amp;s=400\" title=\"Change your avatar at gravatar.com\" width=\"220\" />"
  end
