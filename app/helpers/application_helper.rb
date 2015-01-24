module ApplicationHelper

  def preparing
    @player = current_user.player if(user_signed_in?)
  end

end
