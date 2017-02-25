class Client < XMLRPC::Client
  def fetch
    d_objects = call_async('d.multicall', 'main', *render_downloads_queries).map do |t|
      Hash[QUERIES[:downloads].keys.zip(t)]
    end

    t_commands = render_trackers_commands(d_objects.map { |d| d[:hash] })
    t_objects  = multicall_async(*t_commands).map do |r|
      Hash[QUERIES[:trackers].keys.zip(r.first)]
    end

    d_objects.zip(t_objects).map do |d, t|
      Torrent.new(d.merge(t))
    end
  end

  def load_start(bytes)
    call('load.raw_start', '', bytes)
  end

  private

  def render_downloads_queries
    QUERIES[:downloads].map { |_, v| "d.#{v[:call]}=" }
  end

  def render_trackers_commands(hashes)
    calls = QUERIES[:trackers].map { |_, v| "t.#{v[:call]}=" }

    hashes.map do |h|
      ['t.multicall', h, '', *calls]
    end
  end
end
