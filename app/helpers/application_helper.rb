module ApplicationHelper

  # Create a title helper
  def title
    base_title = "Adam's ROR Sample Application"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end

end
