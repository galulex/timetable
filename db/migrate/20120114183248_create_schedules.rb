class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :dispatcher_id
      t.string :title
      t.integer :lesson_duration

      t.timestamps
    end
  end
end
