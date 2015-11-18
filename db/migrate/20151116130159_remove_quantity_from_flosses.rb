class RemoveQuantityFromFlosses < ActiveRecord::Migration
  def change
  	remove_column :flosses, :quantity, :integer
  end
end
