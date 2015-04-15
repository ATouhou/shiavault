FactoryGirl.define do
  factory :chapter do
    uuid { SecureRandom.uuid }
    sequence(:slug) { |n| "chapter-#{n}" }
    sequence(:title) { |n| "chapter-#{n}" }
  end

  factory :book do
    uuid { SecureRandom.uuid }
    sequence(:slug) { |n| "book-#{n}" }
    sequence(:title) { |n| "book-#{n}" }
    author 'author'
    chapters { build_list(:chapter, 2) }
  end
end