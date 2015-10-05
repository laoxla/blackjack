class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
