# dependencies
require 'json'

class TheHashWhisperer

  def initialize; end

  def drill_into_and_find(key, input, json = false)
    hash = JSON.parse(input) if json == true
    hash = input if input.is_a?(Hash)
    return unless hash && hash.is_a?(Hash)
    keys = key.split('.')
    target = keys.last
    dig_values_for(keys, hash, target)
  end
  
  # This method is pulled from:
  # https://www.cookieshq.co.uk/posts/find-values-key-nested-hash-ruby
  # Thank you for inspiring this gem, Zac Moody!
  def find_all_values_for(key, hash)
    result = []
    result << hash[key] unless hash.is_a? Array
    hash.each do |hash_value|
      result << hash_value[key] unless hash_value.is_a? Array
      if hash_value.is_a? Array
        hash_value.each do |value|
          result << find_all_values_for(key, value) if value.is_a? Hash
        end
      end
    end
    result.compact
  end
  
  def dig_values_for(keys, hash, target, iterating = false)
    result = []
    if (hash.is_a?(Array))
      result << dig_array(keys, hash, target)
    else
      result << hash[target] if (keys.find_index(keys.first) == keys.find_index(keys.last))
    end

    return result.compact.flatten unless keys&.first && hash&.is_a?(Hash) && hash[keys.first]
    if keys[1] && hash[keys.first].include?(keys[1])
      hash = hash[keys.first] if hash.is_a?(Hash) && [keys.first]
      keys.shift
      result << dig_values_for(keys, hash, target)
    else
      if hash.is_a?(Hash) || hash.is_a?(Array)
        hash = hash[keys.first]
        keys.shift unless !iterating
        result << dig_values_for(keys, hash, target)
      end
    end
    result.compact.flatten
  end

  def dig_array(keys, hash, target)
    return unless hash.is_a?(Array)
    result = []
    keys.shift
    hash.each do |value|
      new_keys = keys.clone
      result << dig_values_for(new_keys, value, target, true)
    end
    result.compact.flatten
  end
end