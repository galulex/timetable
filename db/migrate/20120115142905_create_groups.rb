class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :schedule_id
      t.integer :teacher_id
      t.string :name

      t.timestamps
    end
  end
end
