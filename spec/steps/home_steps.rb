# encoding: utf-8



step 'hoge サイトにアクセスする' do
  Capybara.app_host = "http://www.hoge.jp/"
end

step "there is a country" do
  @country = Country.new
end

step 'トップページを表示する' do
  visit '/'
end

step '画面にようこそと表示されていること' do
#  page.should have_content('ようこそ') # should はもう古い
  expect(page).to have_content('ようこそ')
end

step 'id と password を入力する' do
  fill_in 'session_login', :with => 'testuser'
  fill_in 'session_password', :with => 'password'
end

step 'サインインボタンをクリックする' do
  click_button 'サインイン'
end

step "画面にユーザ名 :user が表示されること" do |user|
  expect(page).to have_content(user)
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

