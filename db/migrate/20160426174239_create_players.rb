class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :nation

      t.timestamps null: false
    end
  end
end
