class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :icon
      t.string :introduce
      t.integer :fee
      t.string :area
      t.string :address
      t.string :detail
      t.integer :user_id

      t.timestamps
    end
  end
end
