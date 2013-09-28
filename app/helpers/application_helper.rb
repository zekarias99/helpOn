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

  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end
end