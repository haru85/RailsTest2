class UsersAddColumnIntroduce < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :introduce, :string
  end
end
