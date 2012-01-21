class CreateScheduleCalls < ActiveRecord::Migration
  def change
    create_table :schedule_calls do |t|
      t.integer :schedule_id
      t.time :start_at

      t.timestamps
    end
  end
end
