module HomeHelper
  include TradesHelper

  def max_addable_card_size
    [@player.management.pt, @player.card_limit-@player.cards.size].min
  end

  def trading_cards
    trades = @player.trades.map{|c|c.card_id}
    return Card.where(id: trades)
  end
end
