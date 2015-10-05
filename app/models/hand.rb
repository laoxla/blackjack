class Hand < ActiveRecord::Base

  belongs_to :game
  has_many :cards

    def total
      cards.pluck(:value).sum
    end

   def size
     cards.size
   end
end
