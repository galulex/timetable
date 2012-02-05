class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.integer :dispatcher_id
      t.string :name

      t.timestamps
    end
  end
end
