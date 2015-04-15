require 'rails_helper'

xdescribe ArticleSearch do
  it 'finds all articles' do
    articles = described_class.new.all

    expect(articles.size).to be > 0
    expect(articles.first).to be_a(Article)
  end

  it 'finds an article' do
    slug = 'the-truthful-stone'
    title = 'The Truthful Stone'
    article = described_class.new.find(slug)

    expect(article.slug).to eq(slug)
    expect(article.title).to eq(title)
    expect(article.body).to_not be_empty
  end

  it 'find returns nil if non-existing' do
    article = described_class.new.find('oogy-boogy')
    expect(article).to be_nil
  end
end