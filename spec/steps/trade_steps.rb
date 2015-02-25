# encoding: utf-8

step "■プレイヤー :id が :card を :price で交易に出す" do |id,card,price|
  card = Player.find(id).cards.create(data_id: card_name_to_data_id(card))
  Trade.create(player_id: id, price: price, card_id: card.id)
end