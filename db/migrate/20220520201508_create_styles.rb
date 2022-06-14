class CreateStyles < ActiveRecord::Migration[6.1]
  def change
    create_table :styles do |t|

      t.timestamps
    end
  end
end
