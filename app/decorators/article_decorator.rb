class ArticleDecorator < BaseDecorator

  def html_body
    MarkdownService.new.convert(body).html_safe
  end

end