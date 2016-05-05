class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.references :nation, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
