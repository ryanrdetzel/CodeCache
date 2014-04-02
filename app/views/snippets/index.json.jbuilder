json.array!(@snippets) do |snippet|
  json.extract! snippet, :id, :content, :type
  json.url snippet_url(snippet, format: :json)
end
