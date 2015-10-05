class Addplayerfinish < ActiveRecord::Migration
  def change
    change_table :hands do |t|
      t.boolean :is_finished, default: false
    end
  end
end
