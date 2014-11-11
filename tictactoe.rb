class Board
  attr_accessor :board, :available_pos
  def initialize
    @board = Array.new(3){Array.new(3)}
    @winning_piece = ""
    @available_pos = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
  end

  def won?
   #if all k's are equal, win

      #@board.each do |i|
      @board[0].length.times do |i|
        if @board[i][0] == @board[i][1] && @board[i][0] == @board[i][2]
          @winning_piece = @board[i][0]
          if @winning_piece != nil
            return true
          end
        elsif @board[0][i] == @board[1][i] && @board[0][i] == @board[2][i]
          @winning_piece = @board[0][i]
          if @winning_piece != nil
            return true
          end
        end
        if @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]
          @winning_piece = @board[0][0]
          if @winning_piece != nil
            return true
          end
        elsif @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0]
          @winning_piece = @board[1][1]
          if @winning_piece != nil
            return true
          end
        end
      end
      return false

  end

  def winner
    "#{@winning_piece} wins"
  end

  def empty?(pos)
    if @board[pos[0]][pos[1]] == nil
      true
    else
      false
    end
  end



  def place_mark(pos,mark)
    @board[pos[0]][pos[1]] = mark
    @available_pos.delete(pos)
  end

  def place_mark_winning(pos,mark)
    @board[pos[0]][pos[1]] = mark
    #@available_pos.delete(pos)
  end

  def recover_place_mark(pos)
    @board[pos[0]][pos[1]] = nil
  end

  def full?
    3.times do |i|
      3.times do |j|
        if@board[i][j] == nil
          return false
        end
      end
    end
    true
  end
end

class Game



  def play
    brd = Board.new
    player_one = CompPlayer.new("X")
    player_two = CompPlayer.new("O")
    loop do

      player_one.turn(brd)

      puts brd.inspect

      if brd.won?
        return brd.winner
      end

      if brd.full?
        return "Board is full, draw game"
      end



      player_two.turn(brd)

      puts brd.inspect

      if brd.won?
        return brd.winner
      end

      if brd.full?
        return "Board is full, draw game"
      end

    end
  end

end

class HumanPlayer
  def initialize(mark)
    @mark = mark
  end

  def turn(b)
    while 1
      puts "Make your move, what row?"
      row = gets.chomp.to_i
      puts "What column"
      column = gets.chomp.to_i
      if b.empty?([row,column])
        b.place_mark([row,column], @mark)
        #b.available_pos.delete([row,column])
        return
      else
        puts "position unavailable, choose other row and column"
      end
    end
  end

end

class CompPlayer
  def initialize(mark)
    @mark = mark
  end

  def turn(b)
    # correct
    # pos = b.available_pos.sample
    # b.place_mark(pos, @mark)

    ####
    tmp = winning_move(b)
    if tmp == nil
      pos = b.available_pos.sample
      b.place_mark(pos, @mark)
    else
      b.place_mark(tmp, @mark)
    end
  end

  def winning_move(b)

    (b.available_pos).each do |i|
      c = b.clone
      c.place_mark_winning(i, @mark)
      if c.won?
        return i
      else
        c.recover_place_mark(i)
      end
    end
    return nil
  end



end
