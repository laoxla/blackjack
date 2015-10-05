class Card < ActiveRecord::Base

  belongs_to :game
  belongs_to :hand

end
