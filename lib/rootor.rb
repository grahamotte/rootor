require 'xmlrpc/client'
require 'filesize'
require_relative 'client'
require_relative 'torrent'
require_relative 'queries'

class Rootor
  attr_accessor :client, :torrents

  def initialize(xmlrpc_url)
    @client   = Client.new2(xmlrpc_url)
    @torrents = refresh!
  end

  def refresh!
    @torrents = @client.fetch
  end

  def serialized_torrents
    @torrents.map(&:serialize)
  end

  def pretty_serialized_torrents
    @torrents.map(&:pretty_serialize)
  end

  def find(str)
    return [] if str.empty? || !str.instance_of?(String)
    @torrents.map do |t|
      t if t.serialize.values.any? { |tt| tt.downcase.include? str.downcase } rescue nil
    end.compact
  end

  def load_from_raw(data)
    @client.load_start(XMLRPC::Base64.new(data))
  end

  def load_from_file(path)
    load_from_raw(File.read(path))
  end
end
