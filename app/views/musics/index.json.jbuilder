json.array!(@musics) do |music|
  json.extract! music, :id, :name, :format, :length, :size
  json.url music_url(music, format: :json)
end
