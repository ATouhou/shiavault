class BookDecorator < BaseDecorator

  def html_description
    MarkdownService.new.convert(description).html_safe
  end

  def support_source_message
    case source.try(:to_sym)
    when :alislam
      a = h.link_to 'Al-Islam.org', 'http://www.al-islam.org'
      "Originally found in #{a}. Please support their great work by donating to them!".html_safe
    end
  end

end