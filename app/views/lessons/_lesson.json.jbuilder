json.extract! lesson, :id, :title, :content, :course, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
