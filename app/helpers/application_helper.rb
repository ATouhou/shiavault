module ApplicationHelper
  def meta_description
    return unless content_for?(:meta_description)

    description = h(content_for(:meta_description))
    tag('meta', name: 'description', content: description).html_safe
  end

  def html_title(page = nil)
    [t(:title), h(page)].compact.join(' - ')
  end
end
