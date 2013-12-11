require "redis"

def find (word)
  r = Redis.current
  found = r.smembers word
  puts "found in: " if found.size > 0
  found.each do |ids|
    puts r.get "phrase:#{ids}"
  end
end

find ARGV[0]
