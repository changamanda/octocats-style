json.array!(@students) do |student|
  json.extract! student, :id, :name, :tagline, :image_url
  json.url student_url(student, format: :json)
end
