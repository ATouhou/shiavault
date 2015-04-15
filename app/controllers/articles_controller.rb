class ArticlesController < ApplicationController
  def index
    @articles = ArticleSearch.new.all
  end

  def show
    article = ArticleSearch.new.find(params[:id])
    @article = ArticleDecorator.new(article, view_context)
  end
end
