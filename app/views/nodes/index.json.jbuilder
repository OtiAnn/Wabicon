json.array!(@nodes) do |node|
  json.extract! node, :id, :name, :uuid
  json.url node_url(node, format: :json)
end
