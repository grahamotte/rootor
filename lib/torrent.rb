class Torrent
  def initialize(raw_hash)
    @raw_hash = raw_hash
    serialize.each do |k, v|
      instance_variable_set "@#{k}", v
      self.class.__send__(:attr_accessor, k)
    end
  end

  def serialize(pretty: false)
    Hash[
      @raw_hash.map do |k, v|
        [
          k,
          mutate(FLAT_QUERIES[k][:kind], v, pretty: pretty)
        ]
      end
    ]
  end

  def pretty_serialize
    serialize(pretty: true)
  end

  private

  def mutate(kase, data, pretty:)
    case kase
      when :file
        filesize = Filesize.from("#{data} B")
        pretty ? filesize.pretty : filesize
      when :rate
        filesize = Filesize.from("#{data} B")
        pretty ? "#{filesize.pretty}/s" : filesize
      when :time
        time = Time.at(data)
        pretty ? time.to_s : time
      when :ratio
        data.to_f / 1000
      when :int
        data.to_i
      when :bool
        !!data
      else
        data
    end
  end
end
