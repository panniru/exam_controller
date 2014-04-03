json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :course, :semester, :event, :from, :to
  json.url calendar_url(calendar, format: :json)
end
