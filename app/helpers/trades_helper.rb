module TradesHelper

  def get_trade_from_card(card)
    Trade.find(card.id)
  end
end
