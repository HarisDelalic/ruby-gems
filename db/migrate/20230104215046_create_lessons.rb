class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.references :course

      t.timestamps
    end
  end
end
