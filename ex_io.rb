def guess_game
  computer_number = rand(1...101)
  count = []
  guess = 0
  puts computer_number
  until guess == computer_number
    puts "input a number between 1 and 100"
    guess = gets.chomp.to_i
    count << guess
    if guess < computer_number
      puts "too low"
    elsif guess > computer_number
      puts "too high"
    end
    p count, count.length
  end
  puts "correct guess"
end

def rpn()

  # file_name = ARGV[0]
  # contents = File.readlines(file_name)[0].chomp
  # p contents

end
