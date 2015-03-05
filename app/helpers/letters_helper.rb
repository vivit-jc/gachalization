# encoding: utf-8

module LettersHelper

  def responded?(letter)
    letter.read && letter.ltype != "letter"
  end

  def responce_link(letter)
    if(letter.player_id == @player.id)
      responce_link_of_sent_letter(letter)
    elsif(letter.opp_id == @player.id)
      responce_link_of_given_letter(letter)
    end
  end

  def responce_link_of_sent_letter(letter)
    if(letter.ltype == "treaty" || letter.ltype == "treaty_of_commerce")
      "受諾待ち" unless(letter.read)
    end
  end

  def responce_link_of_given_letter(letter)
  end

  def mark_letter_read
    @letters.each do |l,c|
      next if(l.ltype != "letter")
      l.read = true
      l.save
    end
  end

  def converted_text(letter)
    text = letter.text
    case(letter.ltype)
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


end
