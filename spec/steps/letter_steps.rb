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

step '●プレイヤー :id が送金されている' do |id|
  l = Letter.find_by(opp_id: id, ltype: "send_money")
  expect(l).to be_truthy
end

step '●プレイヤー :id がカードの譲渡を受けている' do |id|
  l = Letter.find_by(opp_id: id, ltype: "send_card")
  expect(l).to be_truthy
end