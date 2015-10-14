class CreateFlosses < ActiveRecord::Migration
  def change
    create_table :flosses do |t|
      t.string :brand
      t.string :colour
      t.integer :quantity
      t.integer :user_id
      t.timestamps
    end
    add_index :flosses, :user_id
  end
end
