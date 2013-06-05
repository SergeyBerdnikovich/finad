class CreateAdvisersQuestions < ActiveRecord::Migration
  def change
    create_table :advisers_questions do |t|
      t.integer :adviser_id
      t.integer :question_id
      t.text :answer

      t.timestamps
    end
  end
end
