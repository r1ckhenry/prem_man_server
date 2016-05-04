class NationsController < ApplicationController

  def index
    nations = Nation.all()
    render( json: nations.to_json( :include => :clubs ) )
  end

  def show
    nation = Nation.find( params[:id] )
    render( json: nation.to_json( :include => :clubs ) )
  end

end
