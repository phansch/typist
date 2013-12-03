FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :lesson do
    desc "i and d"
    text "iiii dddd"
  end

  factory :practice do
    user_id 1
    lesson_id 1
    wpm 30
    cpm 80
  end

end