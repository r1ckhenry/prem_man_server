class AddClubIdToPlayer < ActiveRecord::Migration
  def change
    add_reference :players, :club, index: true
  end
end
