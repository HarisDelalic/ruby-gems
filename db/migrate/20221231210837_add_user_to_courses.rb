class AddUserToCourses < ActiveRecord::Migration[6.1]
  def change
    add_reference :courses, :user, nil: false, index: true
  end
end
