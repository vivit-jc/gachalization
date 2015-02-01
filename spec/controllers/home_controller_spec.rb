require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    @player = FactoryGirl.create(:preset_player)
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
