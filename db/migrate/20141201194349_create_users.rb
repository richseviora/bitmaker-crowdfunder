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

    # adding an index to :email in the :users model
    add_index :users, :email, unique: true
  end
end
