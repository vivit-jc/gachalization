module ApplicationHelper

  def preparing
    @player = current_user.player if(user_signed_in?)
  end

  def all_number_of_resource
    2
  end

end
