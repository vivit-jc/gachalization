# encoding: utf-8

require 'rails_helper'

RSpec.describe CardsController, :type => :controller do

  describe "POST 'improving'" do
    before do
      @player = FactoryGirl.create(:preset_player)
      @player.cards.create(data_id: 1)
      @player.cards.create(data_id: 1)
      @player.cards.create(data_id: 1)
      sign_in :user, @player.user
    end

    it "returns http success" do
      post 'improving', {target: 1, card_id: [2,3]}
      expect(response).to redirect_to(:root)
    end

    it "改良に使ったカードがなくなる" do
      post 'improving', {target: 1, card_id: [2,3]}
      expect(assigns[:player].cards.size).to eq(1)
    end
  end

end
