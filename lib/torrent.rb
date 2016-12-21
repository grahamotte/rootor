class Torrent
  attr_accessor :data

  def initialize(data, queries)
    @data = data
    @queries = queries
  end

  def serialize
    Hash[
      data.each_with_index.map do |value, index|
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
    when :file
      Filesize.from("#{data} B").pretty
    when :rate
      "#{Filesize.from("#{data} B").pretty}/s"
    when :date
      Time.at(data).to_s
    when :ratio
      data.to_f/1000
    when :bool
      !!data
    else
      data
    end
  end
end
