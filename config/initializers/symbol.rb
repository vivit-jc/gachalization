# encoding: utf-8

class Symbol

  def error_to_j
    case(self)
    when :over_card_limit
      "カード所持上限を超えます"
    when :less_management
      "内政力が足りません"
    end
  end

end