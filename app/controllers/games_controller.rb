class GamesController < ApplicationController

  def index
    games = Game.all()
    render( json: games.to_json( :include => { :managers =>  { :include => :club } } ) )
  end

  def show
    game = Game.find( params[:id] )
    render( json: game.to_json(
        :include => {
          :managers => {
            :include => {
                :club => {
                  :include => :players
                }
              }
            }
        })
    )
  end

  def destroy
    Game.delete( params[:id] )
  end

  def create
    game = Game.create()
    render( json: game )
  end

end
