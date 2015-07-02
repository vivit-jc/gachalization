# encoding: utf-8

step "■プレイヤー :id が書簡を送る" do |id|
  Letter.create(player_id: id, opp_id: 1, text: "test", ltype: "letter")
end

step "■プレイヤー :id が相互通商条約を提案" do |id|
  Letter.create(player_id: id, opp_id: 1, text: "相互通商条約の提案", ltype: "treaty_of_commerce")
end

step "■プレイヤー :id が :name を提案" do |id,name|
  Letter.create(player_id: id, opp_id: 1, text: name, ltype: "treaty")
end

step '■プレイヤー :id が資金 :value を送金' do |id,value|
  Letter.create(player_id: id, opp_id: 1, text: value, ltype: "send_money")
end

step '■プレイヤー :id がカード :name を送付' do |id,name|
  card = Card.create(player_id: id, data_id: card_name_to_data_id(name))
  Letter.create(player_id: id, opp_id: 1, text: card.id, ltype: "send_card")
end

step '●プレイヤー :id が条約 :name の提案を受けている' do |id,name|
  l = Letter.find_by(opp_id: id, ltype: "treaty", text: name)
  expect(l).to be_truthy
end

step '●プレイヤー :id が相互通商条約の提案を受けている' do |id|
  l = Letter.find_by(opp_id: id, ltype: "treaty_of_commerce")
  expect(l).to be_truthy
end

step '●プレイヤー :id と :name を締結している' do |id, name|
  l = Treaty.find_by(player_id: 1, opp_id: id, name: name, commerce: nil)
  l = Treaty.find_by(player_id: id, opp_id: 1, name: name, commerce: nil) unless(l)
  expect(l).to be_truthy
end

step '●プレイヤー :id が送金されている' do |id|
  l = Letter.find_by(opp_id: id, ltype: "send_money")
  expect(l).to be_truthy
end

step '●プレイヤー :id がカードの譲渡を受けている' do |id|
  l = Letter.find_by(opp_id: id, ltype: "send_card")
  expect(l).to be_truthy
end