class ClubsController < ApplicationController

  def index
    clubs = Club.all
    render( json: clubs )
  end

  def show
    club = Club.find( params[:id] )
    render( json: club.to_json( :include => :players ) )
  end

end
