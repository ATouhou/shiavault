class ChapterDecorator < BaseDecorator

  def html_body
    MarkdownService.new.convert(body).html_safe
  end

  def next_chapter_link(book)
    next_chapter = book.next_chapter(@model)
    h.link_to 'Next', h.book_chapter_path(book, next_chapter), class: 'next' if next_chapter
  end

  def previous_chapter_link(book)
    previous_chapter = book.previous_chapter(@model)
    h.link_to 'Previous', h.book_chapter_path(book, previous_chapter), class: 'previous' if previous_chapter
  end

  def title
    @model.title.present? ? @model.title : @model.slug
  end
end