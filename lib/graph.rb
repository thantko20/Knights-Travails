class Graph
  attr_accessor :neighbors, :board

  def initialize
    @board = (0..7).to_a.product (0..7).to_a
    @neighbors = gen_neighbors
  end

  def knight_moves(curr=input, dest)
    # TODO
  end

  private

  # I want like this
  # hash = {[0, 0] => [[0,1], [0,2]], etc}
  def gen_neighbors
    moves = {}
    @board.each do |cell|
      gen_moves(cell, moves)
    end
    moves
  end

  def gen_moves(cell, move)
    x = cell[0]
    y = cell[1]
    move[cell] = []
    move[cell].push([x-1,y+2]) if @board.include?([x-1,y+2])
    move[cell].push([x+1,y+2]) if @board.include?([x+1,y+2])
    move[cell].push([x+2,y+1]) if @board.include?([x+2,y+1])
    move[cell].push([x+2,y-1]) if @board.include?([x+2,y-1])
    move[cell].push([x+1,y-2]) if @board.include?([x+1,y-2])
    move[cell].push([x-1,y-2]) if @board.include?([x-1,y-2])
    move[cell].push([x-2,y-1]) if @board.include?([x-2,y-1])
    move[cell].push([x-2,y+1]) if @board.include?([x-2,y+1])
  end
end

graph = Graph.new
moves = {}
graph.board.each do |cell|
  moves[cell] = []
  moves[cell].push([cell[0]-1,cell[1]+2]) if graph.board.include?([cell[0]-1,cell[1]+2])
  moves[cell].push([cell[0]+1,cell[1]+2]) if graph.board.include?([cell[0]+1,cell[1]+2])
  moves[cell].push([cell[0]+2,cell[1]+1]) if graph.board.include?([cell[0]-1,cell[1]+2])
end

p graph.neighbors
