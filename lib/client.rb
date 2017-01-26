class Client < XMLRPC::Client
  def fetch(queries)
    call_async('d.multicall', 'main', *render_queries(queries)).map do |t|
      Torrent.new(t, queries)
    end
  end

  def load_start(bytes)
    call('load.raw_start', '', bytes)
  end

  private

  def render_queries(queries)
    queries.map { |k, v| "d.#{v[:call]}=" }
  end
end
