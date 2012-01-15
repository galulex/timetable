class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :schedule_id
      t.integer :teacher_id
      t.integer :audience_id
      t.string :name

      t.timestamps
    end
  end
end
