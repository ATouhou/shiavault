class BooksController < ApplicationController
  def show
    book = BookSearch.new.find(params[:id])
    @book = BookDecorator.new(book, view_context)
  end
end
