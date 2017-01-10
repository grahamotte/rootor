class Torrent
  def initialize(data, queries)
    @data = data
    @queries = queries
    serialize.each do |k, v|
      self.instance_variable_set "@#{k.to_s}", v
      self.class.__send__(:attr_accessor, k)
    end
  end

  def serialize
    Hash[
      @data.each_with_index.map do |value, index|
        [
          @queries.keys[index],
          mutate(@queries[@queries.keys[index]][:kind], value)
        ]
      end
    ]
  end

  private

  def mutate(kase, data)
    case kase
    when :file, :rate
      Filesize.from("#{data} B")
    when :date
      Time.at(data)
    when :ratio
      data.to_f/1000
    when :bool
      !!data
    else
      data
    end
  end
end
