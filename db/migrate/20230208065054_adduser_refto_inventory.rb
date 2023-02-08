class AdduserReftoInventory < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :user, null: false, foreign_key: true
  end
end
