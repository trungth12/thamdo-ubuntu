class CreateKetquas < ActiveRecord::Migration
  def change
    create_table :ketquas do |t|
      t.integer :sinhvien_id
      t.integer :answer_id
      t.text :answer_text

      t.timestamps
    end
  end
end
