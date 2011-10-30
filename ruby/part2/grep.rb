exit if ARGV.length != 2
exit if not File.exists?(ARGV[1])

word = ARGV[0]
filename = ARGV[1]
open(filename, 'r') {|f|
  cnt = 1
  f.each {|line|
    if /^.*#{word}.*$/ =~ line
      puts "#{cnt}: #{line}"
    end
    cnt += 1
  }
}
