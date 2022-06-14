class AddDeviseTwoFactorBackupableToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :opt_backup_codes, :text, array: true
  end
end
