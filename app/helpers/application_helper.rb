module ApplicationHelper

  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Good Friend").join(" - ")
      end
    end
  end
end

