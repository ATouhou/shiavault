class BookDecorator < BaseDecorator

  def html_description
    MarkdownService.new.convert(description).html_safe
  end

end