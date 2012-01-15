class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :schedule_id
      t.string :first_name
      t.string :last_name
      t.integer :hours

      t.timestamps
    end
  end
end
