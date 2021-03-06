module ApplicationHelper

  # Returns the full title on a per-page basis.   # Documentation comment
  def full_title(page_title)                      # Method definition
    base_title = "Helpon"                         # Variable assignment
    if page_title.empty?                          # Boolean test
      base_title                                  # Implicit return
    else
      "#{base_title} | #{page_title}"             # String interpolation
    end
  end

  def bootstrap_paperclip_picture(form, paperclip_object)
    if form.object.send("#{paperclip_object}?")
      content_tag(:div, class: 'control-group') do
        content_tag(:label, "Current #{paperclip_object.to_s.titleize}", class: 'control-label') +
        content_tag(:div, class: 'controls') do
          image_tag form.object.send(paperclip_object).send(:url, :small)
        end
      end
    end
  end

  def hidden_div_if(condtion, attributes = {}, &block)
    if condtion
      attributes["styel"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end


  def avatar_profile_link(user, image_options={}, html_options={})
    avatar_url = user.avatar? ? user.avatar.url(:thumb) : nil
    link_to(image_tag(user.avatar_url, image_options), current_user(user.full_name), html_options)
  end

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end