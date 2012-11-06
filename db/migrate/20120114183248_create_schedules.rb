class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :dispatcher_id
      t.integer :institution_id
      t.string  :title
      t.boolean :published, :default => false

      t.timestamps
    end
  end
end
