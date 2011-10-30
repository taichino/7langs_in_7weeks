puts 'Hello, World'
puts 'Hello, Ruby'.index('Ruby')
for i in 1..10
  puts i.to_s + ': taichino'
end

begin
  sec = rand(10)
  ans = -1
  until sec == ans
    puts 'forecast?'
    ans = gets.to_i
    if ans < sec
      puts 'too small'
    elsif ans > sec
      puts 'too big'
    end
  end
  puts 'perfect'
end
