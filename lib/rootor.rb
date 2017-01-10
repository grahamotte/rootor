require 'xmlrpc/client'
require 'filesize'
require_relative 'client'
require_relative 'torrent'

class Rootor
  attr_accessor :client, :torrents

  QUERIES = {
    id:                 { call: 'hash', kind: :str },
    name:               { call: 'name', kind: :str },
    path:               { call: 'get_base_path', kind: :str },
    creation_date:      { call: 'creation_date', kind: :date },
    message:            { call: 'message', kind: :str },
    connection_current: { call: 'connection_current', kind: :str },
    is_active:          { call: 'is_active', kind: :bool },
    is_open:            { call: 'is_open', kind: :bool },
    size:               { call: 'size_bytes', kind: :file },
    uploaded:           { call: 'get_up_total', kind: :file },
    downloaded:         { call: 'bytes_done', kind: :file },
    ratio:              { call: 'get_ratio', kind: :ratio },
    up_rate:            { call: 'get_up_rate', kind: :rate },
    down_rate:          { call: 'get_down_rate', kind: :rate },
  }

  def initialize(xmlrpc_url, queries = QUERIES)
    @queries = queries
    @client = Client.new2(xmlrpc_url)
    @torrents = @client.fetch(@queries)
  end

  def refresh
    @torrents = @client.fetch(@queries)
  end

  def serialized_torrents
    serialize(@torrents)
  end

  def find(str)
    return [] if (str.empty? || !str.instance_of?(String))
    @torrents.map do |t|
      begin
        t if t.serialize.values.any? { |tt| tt.downcase.include? str.downcase }
      rescue
        nil
      end
    end.compact
  end

  private

  def serialize(torrents)
    torrents.map(&:serialize)
  end
end
