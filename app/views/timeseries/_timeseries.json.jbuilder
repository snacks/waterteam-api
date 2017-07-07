json.extract! timeseries, :id, :integer, :datetime, :double, :created_at, :updated_at
json.url timeseries_url(timeseries, format: :json)
