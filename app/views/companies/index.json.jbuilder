json.array!(@companies) do |company|
  json.extract! company, 
  json.url company_url(company, format: :json)
end