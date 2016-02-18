json.array!(@dramas) do |drama|
  json.extract! drama, :id, :url, :title, :subbed, :broadcasted_at, :description, :img
  json.url drama_url(drama, format: :json)
end
