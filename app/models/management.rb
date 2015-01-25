class Management < ActiveRecord::Base
  belongs_to :player

  def actual_max
    self.max - self.damage
  end
end
