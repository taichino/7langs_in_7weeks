# not block
f = File.open('sample.txt', 'r')
p f.read

# block
File.open('sample.txt', 'r') {
  |f| p f.read
}

# hash => array
hash = {'a'=>'aaa', 'b'=>'bbb'}
array = hash.values
p array

# array => hash
array = ['a', 'b', 'c']
hash = Hash[*array.map {|item| [array.index(item), item] }.flatten]
p hash

# sweep hash
hash = {:key1=>'val1', :key2=>'val2', :key3=>'val3' }
hash.each {|key, val| p key, val}

# slice
a1 = Array.new(16) {|i| i}
a2 = Array.new(4) {|i| rand(100)}
a1.each {|item|
  index = a1.index(item)
  a2index = index % 4
  p [item, a2[a2index]]
}
a1.each_slice(4) {|item|
  item.zip(a2).each {|pair|
    p pair
  }
}

