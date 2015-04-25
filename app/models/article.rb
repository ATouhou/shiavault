class Article < Page
  attr_accessor :author, :subtitle

  def epub_url
    EbookService.new.public_url("ebooks/articles/#{slug}.epub") if slug.present?
  end

  def mobi_url
    EbookService.new.public_url("ebooks/articles/#{slug}.mobi") if slug.present?
  end

end
