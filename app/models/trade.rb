class Trade < ActiveRecord::Base
  belongs_to :player
  belongs_to :card
  default_scope { where(closed: false) } 

end
