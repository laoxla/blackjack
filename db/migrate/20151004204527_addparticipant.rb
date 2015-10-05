class Addparticipant < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.boolean :participants_finished, default: false
    end
  end
end
