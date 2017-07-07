json.extract! device, :id, :uniqueIdentifier, :type, :latitude, :longitude, :created_at, :updated_at
json.url device_url(device, format: :json)
