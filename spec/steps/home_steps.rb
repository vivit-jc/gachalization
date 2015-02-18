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
