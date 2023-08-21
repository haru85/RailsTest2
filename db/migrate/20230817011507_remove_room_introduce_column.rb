class RemoveRoomIntroduceColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :introduce
  end
end
