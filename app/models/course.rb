class Course < ApplicationRecord
  extend FriendlyId
  friendly_id :title, :use => :history

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  validates :title, :short_description, :language, :price, :level,  presence: true
  validates :description, presence: true, length: { minimum: 5 }

  has_rich_text :description

  belongs_to :user
  has_many :lessons
  has_many :enrollments

  LANGUAGES = [:English, :German, :Bosnian]
  def self.languages
    LANGUAGES.map{|lang| [lang, lang]}
  end

  LEVELS = [:"All Levels", :Beginner, :Intermediate, :Advanced]
  def self.levels
    LEVELS.map{|level| [level, level]}
  end

  def to_s
    title
  end
end
