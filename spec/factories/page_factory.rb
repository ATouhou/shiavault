FactoryGirl.define do
  factory :page do
    uuid { SecureRandom.uuid }
    slug 'sample-id'
    title 'sample'
    path 'articles/sample-path'
  end
end