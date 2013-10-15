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

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end