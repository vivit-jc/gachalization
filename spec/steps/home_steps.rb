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

step ':text ボタンをクリック' do |text|
  click_button text
end

step 'div :name に :text と表示される' do |name, text|
  within("div.#{name}") do
    expect(page).to have_content(text)
  end
end

step 'div :name に :text と表示されない' do |name, text|
  within("div.#{name}") do
    expect(page).not_to have_content(text)
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

step "メニューから :text を選択" do |text|
  select text
end

step "メニュー :name から :text を選択" do |name,text|
  binding.pry
  within("div.#{name}") do
    select text
  end
end

step "ラジオボタンから :text を選択" do |text|
  choose text
end

step "資金が :value である" do |value|
  within("span.money") do
    expect(page).to have_content(value)
  end
end

step "■プリセットプレイヤーを追加" do
  @player = FactoryGirl.create(:preset_player)
end

step "■他プレイヤーを追加" do
  FactoryGirl.create(:opp_player)
end

step 'ログインする' do
  step "■プリセットプレイヤーを追加"
  send ":page にアクセス", "users/sign_in"
  send ":text と表示される", "Log in"
  fill_in 'user_email', with: 'abc@example.com'
  fill_in 'user_password', with: 'abcabcabc'
  send ":text ボタンをクリック", "Log in"
  send ":text と表示されない", "Log in"
end

step "pending" do
  pending "あとでやる"
end
