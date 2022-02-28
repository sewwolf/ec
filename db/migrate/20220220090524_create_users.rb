class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string  :email,            null: false, unique: true
      t.string  :password_digest,  null: false
      t.string  :first_name,       null: false
      t.string  :last_name,        null: false
      t.string  :kana_first_name,  null: false
      t.string  :kana_last_name,   null: false
      t.integer :gender,           null: false, default: 0
      t.string  :telephone_number, null: false
      t.date    :birthday,         null: false
      
      t.timestamps
    end
  end
end
