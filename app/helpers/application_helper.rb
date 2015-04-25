module ApplicationHelper
  def meta_description
    return unless content_for?(:meta_description)

    description = h(content_for(:meta_description))
    tag('meta', name: 'description', content: description).html_safe
  end

  def html_title(page = nil)
    [t(:title), h(page)].compact.join(' - ')
  end

  def support_source_message(source)
    case source.try(:to_sym)
    when :alislam
      a = link_to 'Al-Islam.org', 'http://www.al-islam.org'
      "Originally found in #{a}. Please support their great work!".html_safe
    when :alhassanian
      a = link_to 'Al-Hassanian.org', 'http://alhassanain.org/english/'
      "Originally found in #{a}. Please support their great work!".html_safe
    end
  end

end
