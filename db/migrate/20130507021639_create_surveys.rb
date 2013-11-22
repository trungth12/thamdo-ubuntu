class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.date :open_date
      t.date :close_date
      t.string :title          
      t.boolean :activated
      t.timestamps
    end
  end
end
