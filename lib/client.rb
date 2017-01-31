class Client < XMLRPC::Client
  def fetch(query_keys)
    call_async('d.multicall', 'main', *render_queries(query_keys)).map do |t|
      Torrent.new(Hash[query_keys.zip(t)])
    end
  end

  def load_start(bytes)
    call('load.raw_start', '', bytes)
  end

  private

  def render_queries(query_keys)
    slice(QUERIES, query_keys).map { |_, v| "d.#{v[:call]}=" }
  end

  def slice(hash, keys)
    hash.select { |k, v| keys.include?(k) }
  end
end
