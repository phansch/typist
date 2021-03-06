FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar123"
    password_confirmation "foobar123"
  end

  factory :lesson do
    desc "i and d"
    text "iiii dddd"
  end

  factory :practice do
    user_id 1
    lesson_id 1
    wpm 15
    cpm 80
  end


  factory :invalid_practice, :class => 'practice' do
    user_id 1
    wpm 1
    cpm 1
  end

end
