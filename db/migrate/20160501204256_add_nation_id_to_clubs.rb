class AddNationIdToClubs < ActiveRecord::Migration
  def change
    add_reference :clubs, :nation, index: true, foreign_key: true
  end
end
