require 'rails_helper'
require 'uri'

describe Book do
  let(:book) { build(:book)  }
  let(:chapters) { book.chapters }

  it '#to_param' do
    expect(book.to_param).to eq(book.slug)
  end

  it '#next_chapter' do
    next_chapter = book.next_chapter(chapters.first)

    expect(next_chapter.uuid).to eq(chapters.second.uuid)
    expect(book.next_chapter(chapters.second)).to be_nil
  end

  it '#previous_chapter' do
    previous_chapter = book.previous_chapter(chapters.second)

    expect(previous_chapter.uuid).to eq(chapters.first.uuid)
    expect(book.previous_chapter(chapters.first)).to be_nil
  end

  it '#find_chapter' do
    chapter = book.find_chapter(:slug, chapters.second.slug)
    expect(chapter).to eq(chapters.second)
  end
end
