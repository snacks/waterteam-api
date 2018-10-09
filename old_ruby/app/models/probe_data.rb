class ProbeData
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  store_in collection: "probe_data", database: "test", client: "default" # client defined in mongoid.yml

end