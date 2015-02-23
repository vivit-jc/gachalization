# encoding: utf-8

class TradesController < ApplicationController
before_action :authenticate_user!
before_action :preparing
include TradesHelper


  def index
    @trades = Trade.where(closed: false)
  end

  def create
    return if(error?(verify_creating(@player,params),:root))
    @player.trades.create(card_id: params[:card_id],price: params[:price])
    Card.find(params[:card_id]).update_attribute(:player_id, nil)
    redirect_to :root, notice: "カードを交易に出しました"
  end

  def destroy
    trade = Trade.find(params[:id])
    Card.find(trade.card_id).update_attribute(:player_id, @player.id)
    trade.destroy
    redirect_to :root
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    trade_params = params.require(:trade).permit(:price)
    @trade = Trade.find(params[:id])
    @trade.update(trade_params)
    redirect_to :root
  end

  def buy
    trade = Trade.find(params[:id])
    return if(error?(verify_buying(@player,trade),:trades))
    trade.player.money.add(trade.price)
    @player.money.sub(trade.price)
    trade.card.update_attribute(:player_id, @player.id)
    trade.update_attribute(:closed, true)
    redirect_to :root
  end

end
