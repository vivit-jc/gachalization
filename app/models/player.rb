# encoding: utf-8

class Player < ActiveRecord::Base
  belongs_to :user
  has_many :cards
  has_one :management
  has_one :money
  has_one :country
  has_many :catalogs
  has_many :trades
  has_many :private_logs

  def init
    self.create_management(max: 6, pt: 6)
    self.create_money(pt: 100)
    self.create_country
    self.country.init
  end

  def card_limit
    limit = 7
    limit += self.catalogs.size
    self.cards.each do |card|
      limit += card.effect(:expand_card_limit) if card.have_effect?(:expand_card_limit)
    end
    limit
  end

  def era
    if(self.management.max >= 18)
      3
    elsif(self.management.max >= 14)
      2
    elsif(self.management.max >= 9)
      1
    else
      0
    end
  end
  
  def era_j
    ["古代","中世","近代","現代"][era]
  end

  def gacha(times)
    times = times.to_i
    return :over_card_limit if(card_limit < self.cards.size+times)
    return :less_management if(self.management.pt < times)

    cards = []
    times.times do 
      card = self.cards.create(data_id: rand(CARDS.size))
      cards.push card
    end

    man = self.management
    man.pt -= times
    man.exp += times
    man.levelup
    man.save

    catalogs = self.catalogs.map{|c|c.resource_id}
    cards.each do |card|
      self.catalogs.create(resource_id: card.data_id) if(card.type == :resource && !catalogs.include?(card.data_id))
    end
    cards
  end

  def maximize_management
    self.management.pt = self.management.max
    self.management.save
  end

end
