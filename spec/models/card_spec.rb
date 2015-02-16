require 'rails_helper'

RSpec.describe Card, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "levelup" do
    before do 
      @card = Card.new
    end
    it "" do
      @card.levelup(20)
      expect(@card.level).to eq(2)
    end
  end
end
