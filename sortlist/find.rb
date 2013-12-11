require "redis"




def find (name_given)


  r = Redis.current
  
  found_on = r.zrank :compl, name_given
  return [] if !found_on

  total = r.zcount :compl, '-inf', '+inf'
  find_until = found_on + 50
  find_until = -1 if find_until > total

  data = r.zrange :compl, found_on, find_until

  name = data.collect do |n|
    if !n.include? "*"
      nil
    elsif !n.include? name_given
      nil
    else
      n.chop
    end
  end

  name.compact!

  puts name.to_s

end

find ARGV[0]