class AddQtySoldToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :qty_sold, :integer
  end
end
