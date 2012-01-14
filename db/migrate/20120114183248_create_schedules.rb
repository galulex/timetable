class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :dispatcher_id
      t.string :title

      t.timestamps
    end
  end
end
