FactoryGirl.define do
  factory :player do
    name "MyString"
  end

  factory :preset_player, class: :player do
    name "preset"
    association :user
    management FactoryGirl.create(:management)
    
  end

end
