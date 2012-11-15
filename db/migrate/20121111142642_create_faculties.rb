class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.integer :schedule_id
      t.string :title

      t.timestamps
    end
  end
end
