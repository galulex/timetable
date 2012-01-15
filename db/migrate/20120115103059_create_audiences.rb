class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.integer :schedule_id
      t.string :title

      t.timestamps
    end
  end
end
