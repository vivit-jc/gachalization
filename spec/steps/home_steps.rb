# encoding: utf-8

step ":text と表示される" do |text|
  expect(page).to have_content(text)
end

step ":text と表示されない" do |text|
  expect(page).not_to have_content(text)
end

step ":page を表示する" do |page|
  expect(current_path).to eq(page)
end

step ":page にアクセス" do |page|
  visit "http://localhost/#{page}"
end

step "■カード :card を追加" do |card|
  @player.cards.create(data_id: card_name_to_data_id(card))
end

step "カード :card を持っている" do |card|
  card = card_name_to_data(card)
  within("div.cards")  do
    expect(page).to have_content(card.name)
  end
end

step "カード :card を持っていない" do |card|
  card = card_name_to_data(card)
  within("div.cards") do
    expect(page).not_to have_content(card.name)
  end
end

step "リンク :text をクリック" do |text|
  click_link text
end

step 'ボタン :text をクリック' do |text|
  click_button text
end

step 'div :name に :text と表示される' do |name, text|
  within("div.#{name}") do
    expect(page).to have_content(text)
  end
end

step 'div :name のリンク :text をクリック' do |name, text|
  within("div.#{name}") do
    click_link text
  end
end

step ":space に :value を入力" do |space,value|
  fill_in space, with: value
end

step "画面にユーザ名 :user が表示される" do |user|
  expect(page).to have_content(user)
end

step "プリセットユーザーを追加" do
  @player = FactoryGirl.create(:preset_player)
end

step 'ログインする' do
  step "プリセットユーザーを追加"
  send ":page にアクセス", "users/sign_in"
  send ":text と表示される", "Log in"
  fill_in 'user_email', with: 'abc@example.com'
  fill_in 'user_password', with: 'abcabcabc'
  send "ボタン :text をクリック", "Log in"

end