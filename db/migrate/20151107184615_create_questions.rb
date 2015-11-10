class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.string :type
      t.integer :subject_id
      t.string :correct_answer

      t.timestamps null: false
    end
  end
end
