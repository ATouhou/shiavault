class ChaptersController < ApplicationController
  def show
    @book = BookSearch.new.find(params[:book_id])

    chapter = @book.find_chapter(:slug, params[:id])
    @chapter = ChapterDecorator.new(chapter, view_context)
  end
end
