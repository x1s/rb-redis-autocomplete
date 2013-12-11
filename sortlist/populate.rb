require "redis"

def add_name (n)

  r = Redis.current
  
  (1..(n.length)).each{|l|
      prefix = n[0...l]
      r.zadd(:compl,0,prefix)
  }
  r.zadd(:compl,0,n+"*")

  d = r.get n
  if !d
    id = r.incr "users:uid"
    r.set n, id 
  end
end

add_name ARGV[0]