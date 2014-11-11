def rps()
  arr = ["Rocks", "Paper", "Scissors"]

  puts "what's your move, Rocks, Paper or Scissors. input end if you want to stop"
  users = ""
  until users == 'end'
    users = gets.chomp
  computers = arr.sample

  if arr.include?(users)
    case users
    when 'Rocks'
      if computers == 'Rocks'
        puts "Rocks, Draw"
      elsif computers == 'Paper'
        puts "Paper, Lose"
      else
        puts "Scissors, Win"
      end
    when 'Paper'
      if computers == 'Rocks'
        puts "Rocks, Win"
      elsif computers == 'Paper'
        puts "Paper, Draw"
      else
        puts "Scissors, Lose"
      end
    when 'Scissors'
      if computers == 'Rocks'
        puts "Rocks, Lose"
      elsif computers == 'Paper'
        puts "Paper, Win"
      else
        puts "Scissors, Draw"
      end
    end
  else
    puts "invalid input, please select from Rocks, Paper and Scissors"
  end
end

end



class Mixology

  attr_reader :preprocess, :mixes


  def self.sample_alcohol
    alcohol = ["rum", "gin", "scotch"]
  end

  def self.sample_mixer
    mixer = ["coke", "tonic", "soda"]
  end

  def self.preprocess
    array = []
    sample_alcohol.length.times do |i|
      array.push([sample_alcohol[i],sample_mixer[i]])
    end
    array
  end


  def initialize(preprocess = Mixology.preprocess)
  #def initialize(preprocess=[1,2,3])
    @mixes = preprocess

  end


  def remix()
    array = []
    a = Mixology.sample_alcohol
    m = Mixology.sample_mixer
    @mixes.length.times do |i|
      k = a.sample
      b = m.sample

      while @mixes.include?([k,b])
        k = a.sample
      end
      array.push([k,b])
      a.delete(k)
      m.delete(b)
    end
    array


  end



end
