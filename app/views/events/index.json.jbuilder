json.array!(@events) do |event|
  json.extract! event, :id, :title, :content, :number, :creator_id, :node_id
  json.url event_url(event, format: :json)
end
