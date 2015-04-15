require 'rails_helper'

describe BookSearch do
  it 'finds all books' do
    books = described_class.new.all

    expect(books.size).to be > 0
    expect(books.first).to be_a(Book)
  end

  it 'finds a books' do
    slug = '14-questions-about-imam-az-zaman-volume-1'
    title = '14 Questions about Imam az-Zaman Volume 1'
    book = described_class.new.find(slug)

    expect(book.slug).to eq(slug)
    expect(book.title).to eq(title)
    expect(book.chapters).to_not be_empty
  end

  it 'find returns nil if non-existing' do
    book = described_class.new.find('oogy-boogy')
    expect(book).to be_nil
  end
end