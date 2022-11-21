class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.references :room
      t.integer :start 
      t.integer :end 
      t.string :color
      t.timestamps
    end
  end
end
