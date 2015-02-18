class TradesController < ApplicationController
before_action :authenticate_user!
before_action :preparing

  def index
    @trades = Trade.all
  end

  def create
    
  end

  def delete

  end


  def edit

  end

  def update

  end

  def buy
  end

end
