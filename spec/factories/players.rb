FactoryGirl.define do
  factory :player do
    name "MyString"
  end

  factory :preset_player, class: :player do
    name "preset"
    association :user, factory: :user_preset
    management
    country
    money
  end

  factory :opp_player, class: :player do
    sequence(:name) {|n| "opp#{n}" }
    association :user
    management
    country
    money
  end
end
