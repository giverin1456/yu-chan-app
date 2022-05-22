class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name,            null: false
      t.string :kana,            null: false
      t.integer :gender_id,      null: false
      t.string :phone_number,    null: false
      t.string :postal_code,     null: false
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :street,          null: false
      t.string :building
      t.integer :know_id,        null: false
      t.string :email,           null: false, default: ""
      t.date :birthday,          null: false

      t.text :medical_history
      t.text :contraindication
      t.text :text
      t.timestamps
    end
  end
end
