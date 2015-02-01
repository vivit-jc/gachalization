# encoding: utf-8

class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :preparing

def edit
end

def update
  if @player.update(player_params)
    redirect_to :root, notice: '設定が変更されました'
  else
    render :edit
  end
end

private
  def player_params
    params.require(:player).permit(:name)
  end

end