json.extract! course, :id, :classname, :semester, :year, :created_at, :updated_at
json.url course_url(course, format: :json)
