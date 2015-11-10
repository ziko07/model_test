class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
