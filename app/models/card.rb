class Card < ActiveRecord::Base

  def data
    CARDS[self.data_id]
  end

  def name
    self.data.name
  end
end
