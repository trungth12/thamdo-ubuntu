class RenameEmailToUser < ActiveRecord::Migration
  def up
  	rename_column :users, :email, :username
  end

  def down
  	rename_column :users, :username, :email
  end
end
