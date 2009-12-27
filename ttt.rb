require 'pathname'

module TTT
  EMPTY = 0
  ONE   = 1
  TWO   = 2

  SYM   = { ONE => "X", TWO => "O" }
  SYM.default = " "
  INV   = { ONE => TWO, TWO => ONE }

  DB    = Pathname.new('ttt').expand_path
  DB.mkpath
  
  class Board < Array
    attr_accessor :turn
    
    def won?
      equals(self[0], self[3], self[6]) ||
      equals(self[1], self[4], self[7]) ||
      equals(self[2], self[5], self[8]) ||
      equals(*self[0..2]) ||
      equals(*self[3..5]) ||
      equals(*self[6..8]) ||
      equals(self[0], self[4], self[8]) ||
      equals(self[2], self[4], self[6])
    end

    def equals(*val)
      val.uniq.length == 1 && val[0] != EMPTY
    end
    
    def directory
      DB + (turn.to_s + join)
    end
    
    def touch(str)
      File.open(directory + str, "w").close
    end
    
    def build
      return if directory.exist?
      directory.mkpath
      num = 0
      choices = []
      board = self.dup
      each_with_index do |e, i|
        if e == EMPTY && !won?
          board[i] = (num += 1)
          new_board = dup
          new_board[i] = turn
          new_board.turn = INV[turn]
          choices << new_board
        else
          board[i] = SYM[e]
        end
      end
      
      r1 = board[0..2].join(" ")
      r2 = board[3..5].join(" ")
      r3 = board[6..8].join(" ")
      
      msg = won? ? "#{SYM[INV[turn]]} won" : num.zero? ? "Tie" : "#{SYM[turn]} plays"
      touch("_#{msg.center(15)}_")
      touch("__    #{r1}    __")
      touch("___   #{r2}   ___")
      touch("____  #{r3}  ____")
      
      choices.each_with_index do |b, i|
        File.symlink(b.directory, directory + (i + 1).to_s)
        b.build
      end
    end
  end
end

if __FILE__ == $0
  board = TTT::Board.new(9, 0)
  board.turn = 1
  board.build
end
