# encoding: utf-8

class PlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :preparing

def init
  if(params[:player_name] == "" || params[:country_name] == "")
    p params[:player_name],params[:country_name]
    redirect_to :root, alert: "未入力項目があります"
    return
  end
  current_user.init
  @player = current_user.player
  @player.update_attribute(:name, params[:player_name])
  @player.country.update_attribute(:name, params[:country_name])
  @player.country.update_attribute(:comment, params[:comment])
  redirect_to :root
end

def edit
end

def update
  if @player.update(player_params)
    redirect_to :root, notice: '設定が変更されました'
  else
    render :edit, alert: @player.errors
  end
end

private
  def player_params
    params.require(:player).permit(:name)
  end

end