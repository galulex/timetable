class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :dispatcher_id
      t.integer :institution_id
      t.string  :title
      t.boolean :published, :default => false
      t.time    :lesson_duration
      t.integer :working_days

      t.timestamps
    end
  end
end
