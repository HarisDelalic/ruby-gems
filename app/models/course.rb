class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => :history

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_rich_text :description

  belongs_to :user
end
