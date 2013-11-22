class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :survey_id
      t.text :question_text
      t.integer :question_type_id
      t.integer :display_order
      t.boolean :required

      t.timestamps
    end
  end
end
