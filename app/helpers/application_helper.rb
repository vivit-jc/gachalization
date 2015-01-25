# encoding: utf-8

module ApplicationHelper

  def preparing
    @player = current_user.player if(user_signed_in?)
  end

  def error?(obj,path)
    if obj.class == Symbol
      error_redirect(path,obj.error_to_j)
      true
    else
      false
    end
  end

  def error_redirect(path,alert)
    redirect_to path , alert: alert
  end

  def country_comment(country)
    country.comment || "(コメントはありません)"
  end

  def all_number_of_resource
    count = 0
    CARDS.each do |c|
      count += 1 if c.type == :resource
    end
    return count
  end

end
