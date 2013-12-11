$: << '.'
require "redis"
require "ngram"
require "set"


def find (word)
  result = Set.new
  result2 = []
  r = Redis.current
  data = ngram word
  data.each do |index|
    members = r.smembers index
    members.each{ |m| result.add m }
  end
  result.each do |idx|
    result2.push r.get "user:#{idx.to_i}"
  end
  result2
end

puts find ARGV[0]