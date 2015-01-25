class Card < ActiveRecord::Base
  belongs_to :player

  def data
    CARDS[self.data_id]
  end

  def have_effect?(key)
    nil
  end

  def effect(key)
    nil
  end

  def era_status
    return "too_early" if(self.era > self.player.era)
    "suitable"
  end

  def name
    self.data.name
  end

  def type
    self.data.type
  end

  def power
    self.data.power
  end

  def rerity
    self.data.rerity
  end

  def era
    self.data.era
  end
end
