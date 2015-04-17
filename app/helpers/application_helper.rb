module ApplicationHelper
  def meta_description
    content_for?(:meta_description) ? yield(:meta_description) : t(:meta_description).strip
  end

  def html_title(page = nil)
    [t(:title), page].compact.join(' - ')
  end
end
