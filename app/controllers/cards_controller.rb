# encoding: utf-8

class CardsController < ApplicationController
  include CardsHelper
  before_action :authenticate_user!
  before_action :preparing

  def improve
    @target = Card.find(params[:id])
    return if error?(card_level_max_err(@target), :root)
    @others = @player.cards.reject{|c|c == @target}
  end

  def improving
    cards = Card.where(id: [params[:target]]+params[:card_id])
    return if error?(validate_cards_owner(cards), improve_card_path(params[:target]))
    cards = cards.to_a
    target = cards.delete_at(0)
    return if error?(target.level == 3 ? :levelmax : nil, :root)
    target.improve(cards)
    Card.where(id: cards.map{|c|c.id}).delete_all
    redirect_to :root, notice: "改良しました"
  end

private

  def validate_cards_owner(cards)
    return :not_your_card if(cards.select{|c|c.player != @player}.size > 0)
  end

  def card_level_max_err(card)
    card.level == 3 ? :level_max : nil
  end

end
