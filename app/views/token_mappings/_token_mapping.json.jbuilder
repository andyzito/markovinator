json.extract! token_mapping, :id, :match, :token_type, :token_variant, :replace, :created_at, :updated_at
json.url token_mapping_url(token_mapping, format: :json)
