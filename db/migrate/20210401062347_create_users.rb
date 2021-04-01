class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :remember_digest
      t.string :image
      t.string :name_title
      t.text :profile
      t.integer :gender
      t.integer :residence
      t.integer :age

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
