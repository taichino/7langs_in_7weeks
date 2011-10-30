a = [5, 3, 4, 1]
puts a.sort
puts a.any?{ |i| i > 4 }
puts a.all?{ |i| i > 3 }
puts a.collect{ |i| i ** 2 }.sort()
