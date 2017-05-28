json.array!(@deals) do |deal|
  json.merge! deal.attributes
  json.url deal_url(deal, format: :json)
  json.book do
    json.merge! deal.book.attributes
    json.image deal.book.photos
  end
end
