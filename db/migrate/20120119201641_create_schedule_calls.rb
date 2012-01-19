class CreateScheduleCalls < ActiveRecord::Migration
  def change
    create_table :schedule_calls do |t|
      t.integer :schedule_id
      t.integer :number
      t.datetime :begin
      t.datetime :end

      t.timestamps
    end
  end
end
