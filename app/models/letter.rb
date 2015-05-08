# encoding: utf-8

class Letter < ActiveRecord::Base

  def converted_text
    text = self.text
    case(self.ltype)
    when "letter"
      text
    when "treaty"
      "条約「#{text}」の提案"
    when "treaty_of_commerce"
      "相互通商条約の提案"
    when "send_money"
      "送金: #{text}"
    when "send_card"
      card = Card.find(text)
      "カードの送信: #{card.name}(Lv#{card.level})"
    end
  end

  def your_letter?(player)
    self.player_id == player.id
  end

  def treaty?
    (self.ltype == "treaty" || self.ltype == "treaty_of_commerce")
  end

  def l_present?
    (self.ltype == "send_money" || self.ltype == "send_card")
  end

  def given_or_sent(player)
    (your_letter?(player)) ? "sent" : "given"
  end

  def accepted_j
    self.accepted ? "受諾" : "拒否"
  end

end
