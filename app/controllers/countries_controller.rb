# encoding: utf-8

class CountriesController < ApplicationController
  before_action :authenticate_user!
  before_action :preparing

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    if(@player.country == @country)
      redirect_to :root
      return
    end
  end

  def edit
    @country = @player.country
  end

  def update
    if @player.country.update(country_params)
      redirect_to :root, notice: '設定が変更されました'
    else
      render :edit
    end
  end

private
  def country_params
    params.require(:country).permit(:name, :comment)
  end
end
