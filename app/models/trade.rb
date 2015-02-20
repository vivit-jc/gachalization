class Trade < ActiveRecord::Base
  belongs_to :player

  def to_card
    Card.find(self.card_id)
  end
end
