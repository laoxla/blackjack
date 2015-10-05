class Game < ActiveRecord::Base

  has_many :cards
  has_many :hands


    def winner?

      if dealer_hand.total > player_hand.total && dealer_hand.total  <= 21
           return  "Player Lose"
      elsif player_hand.total > dealer_hand.total && player_hand.total <= 21
           return "Player wins"
       elsif dealer_hand.total ==  player_hand.total
         return   "Player Push"
       elsif player_hand.total == 21
            return "Player wins"
       elsif dealer_hand.total > 21
            return "Player Wins"
      end

    end


    def deck
      cards.where(hand_id: nil).order("position")
    end

    def build_cards
      positions = (1..52).to_a.shuffle

      suits = ["H", "D", "C", "S"]
      suits.each do |suit|
        (2..10).each do |val|
          cards.create suit: suit, value: val, name: val, position: positions.shift
        end
        ["J", "Q", "K"].each do |val|
          cards.create suit: suit, value: 10, name: val, position: positions.shift
        end
        cards.create suit: suit, value: 11, name: "A", position: positions.shift
      end

    end

def player_hand
  hands.find_by player: true
end

def dealer_hand
  hands.find_by player: false
end



end
