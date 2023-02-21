

json.array! @pokemon do |pokemon|
    pokemon.captured ? :id, :number, :name, :image_url, :captured : :id, :number, :name, :captured
end

# json.array! @pokemon, :id, :number, :name, :image_url, :captured