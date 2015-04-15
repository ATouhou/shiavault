FactoryGirl.define do
  factory :article do
    uuid { SecureRandom.uuid }
    slug 'sample-id'
    title 'sample'
    author 'author'
    path 'articles/sample-path'
  end
end