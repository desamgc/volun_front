class Hash

  class << self
    def strip_hash_values(hash)
      hash.each { |_key, value| deep_strip!(value) }
    end

    def strip_array_values(array)
      array.each { |value| deep_strip!(value) }
    end

    def deep_strip!(value)
      case value
        when Hash   then strip_hash_values(value)
        when Array  then strip_array_values(value)
        when String then value.strip!
        else value
      end
    end
  end

end