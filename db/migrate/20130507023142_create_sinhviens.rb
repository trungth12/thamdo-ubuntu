class CreateSinhviens < ActiveRecord::Migration
  def change
    create_table :sinhviens do |t|
      t.string :masinhvien      
      t.string :malop
      t.string :mamon
      t.integer :survey_id
      t.string :tenmon
      t.string :giangvien
      t.string :bomon
      t.datetime :vote_date
      t.string :ip_source

      t.timestamps
    end
  end
end
