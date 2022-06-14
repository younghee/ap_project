class AddStyleToProducts < ActiveRecord::Migration[6.1]
  def up
    add_reference :products, :style, null: false, foreign_key: true
  end
  def down
    #raise ActiveRecord::IrreversibleMigration
    remove_reference :products, :style
  end
end
