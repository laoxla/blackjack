
class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find params[:id]

    #if game.participants_finished
    #     ... wait for 4 seconds
    #     ... redirect_to games_path
    # end


  end

  def create
    @game = Game.create
    @game.build_cards
    player_hand = Hand.create game_id: @game.id, player: true
    dealer_hand = Hand.create game_id: @game.id, player: false

    player_hand.cards << @game.deck.sample(2)
    dealer_hand.cards << @game.deck.sample(2)

    redirect_to game_path(id: @game.id)
  end

  def hit
     @game = Game.find params[:id]
     # add a card to each hand?
     if @game.player_hand.total < 21
       @game.player_hand.cards << @game.deck.first
     end
       redirect_to game_path(id: @game.id)
   end

   def stay
      @game = Game.find params[:id]
      player_hand = @game.player_hand
      player_hand.is_finished = true
      until  @game.dealer_hand.total > 21 || @game.dealer_hand.total >= 17
         @game.dealer_hand.cards << @game.deck.second
      end
      dealer_hand = @game.dealer_hand
      dealer_hand.is_finished = true
      @game.participants_finished = true
      @game.save!
      dealer_hand.save
      player_hand.save
      redirect_to game_path(id: @game.id)

    end

end
