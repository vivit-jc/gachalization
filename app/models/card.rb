class Card < ActiveRecord::Base
  belongs_to :player

  def data
    CARDS[self.data_id]
  end

  def name
    self.data.name
  end

  def type
    self.data.type
  end
end
