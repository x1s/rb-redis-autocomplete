$: << '.'
require "redis"
require "ngram"

def add_name (name)

  r = Redis.current
  user = r.get name

  if !user 
    #r.multi do
      id = r.incr "users:uid"
      data = ngram name
      data.each do |index|
        r.sadd index, id
      end
      r.set name, id
      r.set "user:#{id}", name
    #end
  end 

end

add_name ARGV[0]
