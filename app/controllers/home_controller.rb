class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :preparing
  def index
  end

  def gacha
    @cards_gotten = @player.gacha(params[:times])
    return if(error?(@cards_gotten,:root))
  end

  def debug
    @player.maximize_management
    @player.cards.destroy_all
    redirect_to :root
  end
end
