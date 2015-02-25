FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "preset#{n}@example.com" }
    sequence(:password) {|n| "password#{n}" }
  end

  factory :user_preset, class: :user do
    email "abc@example.com"
    password "abcabcabc"
  end

end
