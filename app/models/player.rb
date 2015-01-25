# encoding: utf-8

class Player < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_one :management
  has_one :money
  has_many :catalogs
  has_many :trades
  has_many :private_logs

  def init
    self.create_management(max: 6, pt: 6)
    self.create_money(pt: 100)
  end

  def card_limit
    10
  end

  def era
    "近代"
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
