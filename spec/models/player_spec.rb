# encoding: utf-8

require 'rails_helper'

RSpec.describe Player, :type => :model do
  before do
    @player = FactoryGirl.create(:player)
    @player.init
  end

  describe "gacha" do
    it "ガチャができる" do
      cards = @player.gacha(1)
      expect(cards.size).to eq(1)
      expect(@player.cards.size).to eq(1)
    end
    it "領地より多くのガチャはできない" do
      @player.management.update_attribute(:pt, 10)
      err = @player.gacha(10)
      expect(err).to eq(:over_card_limit)
    end
    it "内政力が足りなければガチャが引けない" do
      @player.management.update_attribute(:pt, 3)
      err = @player.gacha(4)
      expect(err).to eq(:less_management)
    end
    
  end
end
