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
    full_queries = query_keys.reduce({}) { |h, k| h[k] = QUERIES[k]; h }
    full_queries.map { |_, v| "d.#{v[:call]}=" }
  end
end
