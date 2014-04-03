json.snippets do
    json.array!(@snippets) do |snippet|
        json.uuid snippet.uuid
        json.title snippet.title
        json.content snippet.content
        json.language snippet.language
    end
end
