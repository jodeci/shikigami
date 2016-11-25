FactoryGirl.define do
  factory :book, class: Book do
    title { "This is a Book" }
    author { "Awesome Author" }
  end
end
