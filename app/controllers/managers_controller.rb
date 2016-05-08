class ManagersController < ApplicationController

  def create
    manager = Manager.create( manager_params )
    render( json: manager )
  end

  private

  def manager_params
    params.permit(:first_name, :second_name, :date_of_birth, :club_id, :game_id)
  end

end
