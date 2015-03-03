class LettersController < ApplicationController
before_action :authenticate_user!
before_action :preparing

  def index
    pid = @player.id
    @sent_letters = Letter.where(player_id: pid)
    @given_letters = Letter.where(opp_id: pid)
    @given_countries = Country.where(id: @sent_letters.map{|l|l.opp_id}).pluck(:name)
    @sent_countries = Country.where(id: @given_letters.map{|l|l.player_id}).pluck(:name)
  end

  def show
  end

  def new
    @countries = Country.all.pluck(:name,:id)
    @countries.delete([@player.country.name,@player.country.id])
  end

  def create
    opp_id = Country.find(params[:country_id]).player.id
    Letter.create(player_id: @player.id, opp_id: opp_id, text: params[:text], ltype: params[:type])
    redirect_to :letters
  end
end
