module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}&s=400"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-rounded", width: 220, :rel => "tooltip", :title => "Change your avatar at gravatar.com", 'data-placement' => "bottom")
  end

  def average_wpm_for(user)
    Practice.where(user_id: user.id).limit(10).average("wpm").to_i
  end
end
