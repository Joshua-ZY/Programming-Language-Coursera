# University of Washington, Programming Languages, Homework 6, hw6runner.rb

# This is the only file you turn in, so do not modify the other files as
# part of your solution.

class MyPiece < Piece
  # The constant All_My_Pieces should be declared here
  All_My_Pieces =   All_Pieces + [rotations([[0, -1], [1, -1], [0, 0], [1, 0], [0, 1]]), #first new block
                                  [[[0, 0], [-2, 0], [-1, 0], [1, 0], [2, 0]], # second new block (only needs two)
                                   [[0, 0], [0, -2], [0, -1], [0, 1], [0, 2]]],
                                  rotations([[0, 0], [0, 1], [1, 0]])] #third new block    
  # your enhancements here
  def initialize (point_array, board, piece_size_in = nil)
    super(point_array, board)
    @piece_size_in = piece_size_in
  end
  def self.next_piece (board)
    @pick = All_My_Pieces.sample
    @piece_size = @pick[0].size  #the next line will make a new MyPiece instance which will set piece_size to nil.
    MyPiece.new(@pick, board, @piece_size) #therefore it is necessary to input piece_size into the new instance
  end
  def self.cheat_piece (board)
    MyPiece.new([[[0,0]]], board, 1)
  end
  def get_piece_size
    @piece_size_in
  end
end

class MyBoard < Board
  # your enhancements here
  def initialize(game)
    super
    @current_block = MyPiece.next_piece(self)
    @cheat_on = false
  end
  def rotate_180
    if !game_over? and @game.is_running?
      @current_block.move(0, 0, 2)
    end
    draw
  end
  def cheat
    if !game_over? and @game.is_running? and @score >= 100 and !@cheat_on
      @score -= 100
      @cheat_on = true
    end
  end
  def next_piece (cheat = false)
    if cheat
      @current_block = MyPiece.cheat_piece(self)
    else
      @current_block = MyPiece.next_piece(self)
    end
    @current_pos = nil
  end
  def store_current
    locations = @current_block.current_rotation
    displacement = @current_block.position
    piece_size = @current_block.get_piece_size
    (0..(piece_size - 1)).each{|index| 
      current = locations[index];
      @grid[current[1]+displacement[1]][current[0]+displacement[0]] = 
      @current_pos[index]
    }
    remove_filled
    @delay = [@delay - 2, 80].max
  end
  def run
    ran = @current_block.drop_by_one
    if !ran
      store_current
      if !game_over?
        if @cheat_on
          next_piece(true)
          @cheat_on = false
        else
          next_piece
        end
      end
    end
    @game.update_score
    draw
  end
  def drop_all_the_way
    if @game.is_running?
      ran = @current_block.drop_by_one
      @current_pos.each{|block| block.remove}
      while ran
        @score += 1
        ran = @current_block.drop_by_one
      end
      draw
      store_current
      if !game_over?
        if @cheat_on
          next_piece(true)
          @cheat_on = false
        else
          next_piece
        end
      end
      @game.update_score
      draw
    end
  end
end

class MyTetris < Tetris
  # your enhancements here
  def set_board
    @canvas = TetrisCanvas.new
    @board = MyBoard.new(self)
    @canvas.place(@board.block_size * @board.num_rows + 3,
                  @board.block_size * @board.num_columns + 6, 24, 80)
    @board.draw
  end    
  def buttons
    super
    rotate_180 =  TetrisButton.new('R180', 'lightgreen'){@board.rotate_180}
    rotate_180.place(35, 50, 27, 501)
    cheat = TetrisButton.new('Cheat', 'lightgreen'){@board.cheat}
    cheat.place(35, 50, 127, 501)
  end
  def key_bindings
    super
    @root.bind('u',proc{@board.rotate_180})
    @root.bind('c',proc{@board.cheat})
  end
end
