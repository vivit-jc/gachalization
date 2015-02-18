require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  before do
    @player = FactoryGirl.create(:preset_player)
    @user = @player.user
    sign_in :user, @user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe 'gacha' do
    it "" do
      post 'gacha', times: 1
      expect(response).to be_success
    end
  end

end
