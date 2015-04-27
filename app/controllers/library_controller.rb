class LibraryController < ApplicationController
  layout 'minimal'

  def index
    @articles = ArticleSearch.new.all
    @books = BookSearch.new.all
  end
end
