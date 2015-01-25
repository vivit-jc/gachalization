# encoding: utf-8

class Management < ActiveRecord::Base
  belongs_to :player

  def actual_max
    self.max - self.damage
  end

  def levelup
    if(self.exp >= (self.max+1)/2)
      self.exp -= (self.max+1)/2
      self.max += 1
      self.save
      self.player.private_logs.create(text: "最大内政力が#{self.max}になりました")
    end
  end
end
