class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.text :answer_text
      t.integer :display_order
      t.integer :score_point

      t.timestamps
    end
  end
end
