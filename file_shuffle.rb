# class Shuffle
  # def initialize
  #   @file = gets.chomp
  # end
  #
  # def self.read_lines
  #   contents = []
  #   contents = File.readlines(@file)
  # end
  #
  # def write_to_file
  #   contents = Shuffle.read_lines.shuffle
  #   file_name = @file[0...-4] + "-shuffled.txt"
  #   File.open(file_name,"w") do |f|
  #     f.puts contents
  #   end
  # end
# end



def read_lines(file)
  contents = []
  contents = File.readlines(file)
end

def write_to_file
  contents = read_lines("test.txt").shuffle
  file_name = "test.txt"[0...-4] + "-shuffled.txt"
  File.open(file_name,"w") do |f|
    f.puts contents
  end
end
