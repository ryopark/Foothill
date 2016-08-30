json.merge! @book.attributes
json.image @book.photos.first.image.url
