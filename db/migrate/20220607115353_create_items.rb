class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.date "day", null: false
      t.string "time", null: false
      t.string "name",   null: false
      t.datetime "start_time", null: false
      # t.index ["user_id"], name: "index_reservations_on_user_id"
      t.timestamps
    end
  end
end
