class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :facebook_id
      t.integer :institution_id
      t.string  :type
      t.string  :email
      t.string  :first_name
      t.string  :last_name
      t.string  :password_digest
      t.string  :password_salt
      t.string  :token

      t.timestamps
    end
  end
end
