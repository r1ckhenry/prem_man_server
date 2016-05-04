class AddNationIdToPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :nation
    add_reference :players, :nation, index: true, foreign_key: true
  end
end
