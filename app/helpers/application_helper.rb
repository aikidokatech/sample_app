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
end
