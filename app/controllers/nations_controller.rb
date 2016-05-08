class NationsController < ApplicationController

  def index
    nations = Nation.all()

    if params[:leagues] == "true" && params[:clubs] == "true"
      render( json: nations.to_json( :include => { :leagues => { :include => :clubs }}))
    elsif params[:leagues] == "true"
      render( json: nations.to_json( :include => :leagues ) )
    else
      render( json: nations )
    end
  end

  def show
    nation = Nation.find( params[:id] )
    render( json: nation.to_json( :include => :clubs ) )
  end

end
