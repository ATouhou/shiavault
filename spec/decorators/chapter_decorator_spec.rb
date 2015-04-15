require 'rails_helper'

describe ChapterDecorator do
  include ActionView::TestCase::Behavior

  let(:book) { build(:book, chapters: build_list(:chapter, 2)) }
  let(:chapters) { book.chapters }
  let(:chapter) { chapters.first }

  it '#html_body' do
    mock = double(:chapter, body: '**Sample**')
    expect(described_class.new(mock).html_body).to eq("<p><strong>Sample</strong></p>\n")
  end

  describe '#previous_chapter_link' do
    it 'returns previous chapter' do
      link = described_class.new(book.chapters.second, view).previous_chapter_link(book)
      expect(link).to include(view.book_chapter_path(book, book.chapters.first))
    end

    it 'returns nil if no other chapter' do
      link = described_class.new(book.chapters.first, view).previous_chapter_link(book)
      expect(link).to be_nil
    end
  end

  describe '#next_chapter_link' do
    it 'returns next chapter' do
      link = described_class.new(book.chapters.first, view).next_chapter_link(book)
      expect(link).to include(view.book_chapter_path(book, book.chapters.second))
    end

    it 'returns nil if no other chapter' do
      link = described_class.new(book.chapters.second, view).next_chapter_link(book)
      expect(link).to be_nil
    end
  end
end