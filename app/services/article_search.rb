require 'json'

class ArticleSearch
  attr_reader :git_service

  def initialize(git_service: GIT_SERVICE.new)
    @git_service = git_service
  end

  def all
    metadata.map do |_, article_metadata|
      Article.new(article_params(article_metadata))
    end.compact
  end

  def find(id)
    article_metadata = metadata.fetch(id, nil)
    return nil unless article_metadata

    Article.new(article_params(article_metadata))
  end

  def find!(id)
    book = find(id)
    fail ActiveRecord::RecordNotFound unless book
    book
  end

  private

  def article_params(metadata)
    metadata.symbolize_keys.slice(:uuid, :title, :slug, :author, :path, :source)
  end

  def metadata
    @@metadata ||= begin
      # raw = git_service.get('articles.json')
      # JSON.parse(raw)

      # TODO: Consider later on
      []
    end
  end
end