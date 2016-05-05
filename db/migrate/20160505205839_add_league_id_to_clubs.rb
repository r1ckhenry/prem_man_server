class AddLeagueIdToClubs < ActiveRecord::Migration
  def change
    add_reference :clubs, :league, index: true, foreign_key: true
  end
end
