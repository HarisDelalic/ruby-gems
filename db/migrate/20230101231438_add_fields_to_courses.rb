class AddFieldsToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :short_description, :text
    add_column :courses, :level, :string, default: "All Levels", null: false
    add_column :courses, :language, :string, default: "English", null: false
    add_column :courses, :price, :integer
  end
end
