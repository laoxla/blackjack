class Addhand < ActiveRecord::Migration
  def change
    change_table :hands do |t|
    t.boolean  :player
    end
  end
end
