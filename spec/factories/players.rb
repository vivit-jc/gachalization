FactoryGirl.define do
  factory :player do
    name "MyString"
  end

  factory :preset_player, class: :player do
    sequence(:name) {|n| "preset#{n}" }
    association :user
    management
    country
    money
  end

end
