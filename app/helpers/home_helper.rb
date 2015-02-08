module HomeHelper
  def max_addable_card_size
    [@player.management.pt, @player.card_limit-@player.cards.size].min
  end
end
