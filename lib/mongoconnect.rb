require 'mongo'

class Mongoconnect

  def initialize
    @client = Mongo::Client.new(['127.0.0.1:27017'], :database => 'test')
  end

  def client
    @client
  end

  def probe_data
    @client[:probe_data]
  end
end