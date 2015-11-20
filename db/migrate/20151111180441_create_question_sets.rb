class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :model_test_id
      t.integer :question_id
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
