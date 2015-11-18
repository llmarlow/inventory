class CreateQuantities < ActiveRecord::Migration
  def change
    create_table :quantities do |t|
      t.references :floss, index: true
      t.references :user, index: true
      t.integer :quantity , default: 0

      t.timestamps
    end
  end
end
