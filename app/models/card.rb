class Card < ActiveRecord::Base
  belongs_to :player
  has_one :trade

  def data
    CARDS[self.data_id]
  end

  def have_effect?(key)
    nil
  end

  def effect(key)
    nil
  end

  # in 材料となるカードの配列
  def improve(cards)
    exp = 0
    cards.each do |c|
      exp += c.level
      exp += c.level if(c.type == self.type)
    end
    self.levelup(exp)
  end

  def levelup(exp)
    exp += self.exp
    [20,60].each_with_index do |pt, level|
      if(self.level == level+1 && exp >= pt)
        self.level += 1
        exp -= pt
      end
    end
    self.exp = exp
    self.save
  end

  def era_status
    return "suitable" unless(self.player)
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
