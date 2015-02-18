module CardsHelper

  def card_name_to_data_id(str)
    CARDS.each do |c|
      return c.id if(c.name == str)
    end
  end

  def card_name_to_data(str)
    CARDS.each do |c|
      return c if(c.name == str)
    end
  end

end
