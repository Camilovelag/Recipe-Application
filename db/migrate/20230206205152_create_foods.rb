class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :price
      t.string :unit

      t.timestamps
    end
  end
end
