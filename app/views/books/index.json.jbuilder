json.array!(@books) do |book|
  json.merge! book.attributes
  json.url book_url(book, format: :json)
  json.image book.photos
end
