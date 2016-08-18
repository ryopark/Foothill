json.seller do
  json.name @book.user.name
  json.facebook_url @book.user.facebook_url
  json.image @book.user.photo.image(:thumb)
end

json.merge! @book.attributes
json.image @book.photos.first.image.url
