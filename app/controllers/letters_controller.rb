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
    Letter.create(player_id: @player.id, opp_id: opp_id, text: text, ltype: params[:type])
    redirect_to :letters
  end

  def accept
    redirect_to :letters
  end

  def reject
    redirect_to :letters
  end

  def open_present
    redirect_to :letters
  end
end
