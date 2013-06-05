class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body
      t.boolean :faq

      t.timestamps
    end
  end
end
