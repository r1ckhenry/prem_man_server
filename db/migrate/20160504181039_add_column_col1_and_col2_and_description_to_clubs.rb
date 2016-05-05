class AddColumnCol1AndCol2AndDescriptionToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :col_1, :string
    add_column :clubs, :col_2, :string
    add_column :clubs, :description, :string
  end
end
