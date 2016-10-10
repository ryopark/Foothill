json.merge! @deal.attributes
json.merge! @deal.book.attributes
json.image @deal.book.photos
json.seller do
  json.name @deal.seller.name
  json.image @deal.seller.photo.image(:thumb)
end
