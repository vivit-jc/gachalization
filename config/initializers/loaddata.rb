
require "#{Rails.root}/app/models/card_data"

CARDS = YAML.load(File.open("#{Rails.root}/config/carddata.yml"))

# id付与処理
data = [CARDS]
data.each do |array|
  array.each_with_index do |column, i|
    column.id = i
  end
end

