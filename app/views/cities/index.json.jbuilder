json.array! @cities do |city|
  json.id city.id
  json.text city.to_s
end
