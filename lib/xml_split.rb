require "xml_split/version"

class XmlSplit
  class << self
    def sgrep_bin
      @sgrep_bin ||= POSSIBLE_BIN_NAMES.detect { |bin| `which #{bin}`; $?.success? } or raise("Can't find any of #{POSSIBLE_BIN_NAMES.inspect} in your PATH")
    end
  end

  POSSIBLE_BIN_NAMES = %w{ sgrep sgrep2 }
  MAGIC_START = 'n8frNy6J'
  MAGIC_STOP = 'H6py5pxG'
  CHUNK_SIZE = 65536

  include Enumerable

  attr_reader :path
  attr_reader :element
  attr_reader :caching

  def initialize(path, element, options = {})
    @nodes = []
    @cache_full = false

    @path = File.expand_path path
    @element = element
    @caching = options.fetch :caching, false
  end

  def each(&blk)
    if caching and @cache_full
      @nodes.each(&blk)
    else
      caching = caching
      leftover = ''
      IO.popen([ XmlSplit.sgrep_bin, '-n', '-o', "#{MAGIC_START}%r#{MAGIC_STOP}", %{"#{start}" .. "#{stop}"}, path ]) do |io|
        while additional = io.read(CHUNK_SIZE)
          buffer = leftover + additional
          while (start = buffer.index(MAGIC_START)) and (stop = buffer.index(MAGIC_STOP))
            node = buffer[(start+MAGIC_START.length)...stop] + '>'
            if caching
              @nodes << node
            end
            yield node
            buffer = buffer[(stop+MAGIC_STOP.length)..-1]
          end
          leftover = buffer
        end
      end
      @cache_full = true
    end
  end

  private

  def start
    "<#{element}"
  end

  def stop
    "</#{element}"
  end

end
