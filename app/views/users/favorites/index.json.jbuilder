json.array!(@books) do |book|
  json.merge! book.attributes
  json.image book.photos.first.image.url
  json.url sell_book_url(book, format: :json)
  json.seller do
    json.name book.user.name
    json.image book.user.photo.image(:thumb)
  end
end
