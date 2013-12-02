FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

FactoryGirl.define do
  factory :lesson do
    desc "i and d"
    text "iiii dddd"
  end

end