FactoryGirl.define do
  factory :country do
    x 1
    y 1
    sequence(:name) {|n| "country#{n}" }
  end
end
