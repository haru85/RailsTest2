class RemoveRoomAreaColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :area
  end
end
