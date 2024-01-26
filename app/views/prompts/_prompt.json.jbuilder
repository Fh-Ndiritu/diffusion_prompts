json.extract! prompt, :id, :split_id, :row_idx, :content, :truncated_cells, :partial, :created_at, :updated_at
json.url prompt_url(prompt, format: :json)
