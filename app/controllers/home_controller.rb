class HomeController < ApplicationController
  before_action :authenticate_user!, only: :show
  def index
    @player = current_user.player
  end
end
