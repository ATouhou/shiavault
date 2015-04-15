class LibraryController < ApplicationController
  def index
    @articles = ArticleSearch.new.all
    @books = BookSearch.new.all
  end
end
