# encoding: utf-8

require 'rails_helper'

RSpec.describe TradesController, :type => :controller do
    describe "POST 'create'" do
    before do
      @player = FactoryGirl.create(:preset_player)
      @player.cards.create(data_id: 1)
      @player.cards.create(data_id: 1)
      @player.cards.create(data_id: 1)
      sign_in :user, @player.user
    end

    it "returns http success" do
      post 'create', {card_id: 1, value: 20}
      expect(response).to redirect_to(:root)
    end

    it "交易に出したカードは自分で参照できない" do
      post 'improving', {card_id: 1, value: 20}
      expect(assigns[:player].cards.size).to eq(2)
    end
  end
end
