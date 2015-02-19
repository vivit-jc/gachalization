# encoding: utf-8

class TradesController < ApplicationController
before_action :authenticate_user!
before_action :preparing

  def index
    @trades = Trade.all
  end

  def create
    @player.trades.create(card_id: params[:card_id],price: params[:price])
    Card.find(params[:card_id]).update_attribute(:player_id, nil)
    redirect_to :root, notice: "カードを交易に出しました"
  end

  def delete

  end


  def edit

  end

  def update

  end

  def buy
  end

end
