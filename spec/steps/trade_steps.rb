# encoding: utf-8

step %(:textと表示されている) do |text|
  expect(page).to have_content(text)
end