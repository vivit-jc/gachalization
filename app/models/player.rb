class Player < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  def init
  end

  def gacha(times)
    cards = []
    times.to_i.times do 
      card = self.cards.create(data_id: rand(CARDS.size))
      cards.push card
    end
    cards
  end
end
