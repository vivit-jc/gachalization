class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :preparing
  def index
    @player = current_user.init if(user_signed_in? && !current_user.player)
  end

  def gacha
    @cards_gotten = @player.gacha(params[:times])
  end
end
