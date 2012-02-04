class CreateReplacements < ActiveRecord::Migration
  def change
    create_table :replacements do |t|
      t.integer :schedule_id
      t.integer :teacher_id
      t.integer :audience_id
      t.integer :group_id
      t.integer :day_id
      t.integer :schedule_call_id
      t.string  :name
      t.integer :lesson_id
      t.date    :date

      t.timestamps
    end
  end
end
