class RenameTypeToTypename < ActiveRecord::Migration
  def up
  	rename_column :question_types, :type, :type_name
  end

  def down
  	rename_column :question_types, :type_name, :type
  end
end
