module UsersHelper

  # This is Micheal Hertle's style.
  # # Returns the Gravatar (http://gravatar.com/) for the given user.
  # def gravatar_for(user)
  #   gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #   gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  #   image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end

  def avatar_profile_link(user, image_options={}, html_options={})
            avatar_url = user.avatar? ? user.avatar.url(:thumb) : :nil
            link_to(image_tag(avatar_url, image_options), 
	        user_path(user), html_options)
  end
end