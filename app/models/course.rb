class Course < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 255 }

  has_rich_text :description
end
