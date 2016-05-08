class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.references :club, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true
      t.string :first_name
      t.string :second_name
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
