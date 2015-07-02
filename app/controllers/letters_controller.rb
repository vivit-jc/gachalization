class LettersController < ApplicationController
include LettersHelper
before_action :authenticate_user!
before_action :preparing
after_action  :mark_letter_read, only: [:index]

  def index
    pid = @player.id
    @letters = []
    @sent_letters = Letter.where(player_id: pid)
    @given_letters = Letter.where(opp_id: pid)
    @given_countries = Country.where(id: @sent_letters.map{|l|l.opp_id}).pluck(:name)
    @sent_countries = Country.where(id: @given_letters.map{|l|l.player_id}).pluck(:name)
    temp_letters = @sent_letters+@given_letters
    temp_countries = @given_countries+@sent_countries

    # 手紙の内容と、その送り主/宛先を合体させ、時間に昇順に並べる
    (@sent_letters.size+@given_letters.size).times do |i|
      @letters.push [temp_letters[i],temp_countries[i]]
    end
    @letters.sort!{|a,b|b[0].created_at <=> a[0].created_at}

  end

  def show
  end

  def new
    @countries = Country.all.pluck(:name,:id)
    @countries.delete([@player.country.name,@player.country.id])
    @cards = @player.cards
    @cards = @cards.map{|c|["#{c.name}(Lv#{c.level},#{c.exp}exp)"]}
  end

  def create
    opp_id = Country.find(params[:country_id]).player.id
    text = params[:type] == "send_card" ? params[:card_id] : params[:text]
    Letter.create(player_id: @player.id, opp_id: opp_id, subject: params[:subject], text: text, ltype: params[:type])
    redirect_to :letters
  end

  def accept
    letter = Letter.find(params[:id])
    if(letter.ltype == "treaty")
      Treaty.create(player_id: letter.player_id, opp_id: letter.opp_id, name: letter.subject, text: letter.text)
    elsif(letter.ltype == "treaty_of_commerce")
      Treaty.create(player_id: letter.player_id, opp_id: letter.opp_id, commerce: true)
    end
    letter.accepted = true
    letter.read = true
    letter.save
    redirect_to :letters
  end

  def reject
    letter = Letter.find(params[:id])
    letter.accepted = false
    letter.read = true
    redirect_to :letters
  end

  def open_present
    letter = Letter.find(params[:id])
    if(letter.ltype == "send_money")
      Player.find(letter.opp_id).money.add(letter.text.to_i)
    elsif(letter.ltype == "send_card")
      card = Card.find(letter.text.to_i)
      card.update_attribute(:player_id, letter.opp_id)
    end
    letter.read = true
    letter.save
    redirect_to :letters
  end
end
