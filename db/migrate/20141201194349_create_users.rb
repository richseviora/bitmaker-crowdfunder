class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # <:null => false> prevents the field from being empty
      t.string :first_name,       :null => false
      t.string :last_name,        :null => false
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.timestamps
    end

    add_index :email, unique: true
  end
end
