json.extract! contact, :id, :name, :title, :email, :created_at, :updated_at
json.url contact_url(contact, format: :json)
