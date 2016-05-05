class CreateBrains < ActiveRecord::Migration
  def change
    create_table :brains do |t|
      t.references :player, index: true, foreign_key: true
      t.integer :decisions

      t.timestamps null: false
    end
  end
end
