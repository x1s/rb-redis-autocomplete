$: << '.'
require "redis"

def populate (phrase)

  r = Redis.current
  id = r.incr "phrase::uid"
  r.set phrase, id
  r.set "phrase:#{id}", phrase

  phrase.split(" ").each do |word|
    r.sadd word, id
  end

end

populate ARGV[0]
