class Book
  include ActiveModel::Model

  attr_accessor :uuid,
                :title,
                :subtitle,
                :author,
                :slug,
                :description,
                :source,
                :chapters

  def to_param
    slug
  end

  def next_chapter(chapter)
    i = chapters.find_index { |c| c.uuid == chapter.uuid }
    chapters[i+1]
  end

  def previous_chapter(chapter)
    i = chapters.find_index { |c| c.uuid == chapter.uuid }
    return nil if i < 1 # Prevent reverse seek

    chapters[i-1]
  end

  def find_chapter(attribute, value)
    chapters.find do |chapter|
      chapter.__send__(attribute) == value
    end
  end

end
