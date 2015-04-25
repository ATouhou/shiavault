class BookDecorator < BaseDecorator

  def html_description
    MarkdownService.new.convert(description).html_safe
  end

  def chapters
    @model.chapters.map { |chapter| ChapterDecorator.new(chapter, @view) }
  end
end