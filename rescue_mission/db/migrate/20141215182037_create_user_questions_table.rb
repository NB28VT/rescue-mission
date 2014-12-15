class CreateUserQuestionsTable < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end

  def down
    drop_table :questions
  end

end
