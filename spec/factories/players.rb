FactoryGirl.define do
  factory :player do
    name "MyString"
  end

  factory :preset_player do
    name "preset"
    management FactoryGirl.create(:management)
    
  end

end
