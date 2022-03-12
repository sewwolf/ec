class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :cart,          null: false, foreign_key: true
      t.references :product,       null: false, foreign_key: true
      t.integer :quantity,         null: false

      t.timestamps
    end
  end
end