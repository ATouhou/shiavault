require 'rails_helper'

describe Article do
  let(:article) { build(:article) }

  it '#epub_url' do
    url = article.epub_url
    expect(url).to match(URI::regexp)
    expect(url).to end_with("ebooks/articles/#{article.slug}.epub")
  end

  it '#mobi_url' do
    url = article.mobi_url
    expect(url).to match(URI::regexp)
    expect(url).to end_with("ebooks/articles/#{article.slug}.mobi")
  end

  it 'return nil if no ebook' do
    article.slug = nil
    expect(article.epub_url).to be_nil
    expect(article.mobi_url).to be_nil
  end

end
