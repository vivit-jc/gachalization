# encoding: utf-8

step %(:textと表示) do |text|
  expect(page).to have_content(text)
end

step %(:textを表示) do |text|
  expect(page).to have_content(text)
end