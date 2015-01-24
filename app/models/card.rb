class Card < ActiveRecord::Base

  def data
    CARDS[self.data_id]
  end

end
