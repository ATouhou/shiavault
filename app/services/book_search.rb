require 'json'

class BookSearch
  attr_reader :git_service

  def initialize(git_service: GIT_SERVICE.new)
    @git_service = git_service
  end

  def all
    metadata.map do |_, meta|
      Book.new(book_params(meta))
    end.compact
  end

  def find(id)
    meta = metadata.fetch(id, nil)
    return nil unless meta

    Book.new(
      chapters: chapters(meta),
      ** book_params(meta)
    )
  end

  private

  def chapters(metadata)
    metadata['chapters'].map do |chapter|
      Chapter.new(** chapter_params(chapter))
    end
  end

  def chapter_params(metadata)
    metadata.symbolize_keys.slice(:uuid, :title, :subtitle, :slug, :path, :source)
  end

  def book_params(metadata)
    metadata.symbolize_keys.slice(:uuid, :title, :subtitle, :slug, :description, :author, :source)
  end

  def metadata
    @@metadata ||= begin
      raw = git_service.get('books.json')
      JSON.parse(raw)
    end
  end
end