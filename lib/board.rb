require_relative 'board_cells'
require_relative 'knights'

class Board
  include Creatable
  attr_accessor :neighbor_cells

  def initialize
    @neighbor_cells = add_each_cell_neighbors
  end

  def knight_moves(curr, dest)
    #binding.pry
    # TODO
    q = []
    q.push(curr)

    visited = []
    visited.push(curr)

    prev = []
    while !q.empty?
      node = q.shift
      moves = neighbors[node]

      moves.each do |move|
        unless visited.include?(move)
          q.push(move)
          visited.push(move)
          prev.unshift([node, move])
          if move == dest
            q.clear
            break
          end
        end
      end
    end
    construct_path(prev)
  end

  def construct_path(prev)
    arr = []
    curr_child = prev.first.last
    arr.push(curr_child)

    prev.each do |relation|
      if relation.last == curr_child
        curr_child = relation.first
        arr.unshift(curr_child)
      end
    end
    arr
  end

  private

  def add_each_cell_neighbors
    adjacency_hash = {}
    board_cells.each do |cell|
      node = Knight.new(cell)
      adjacency_hash[node.src] = node.legal_moves
    end
    adjacency_hash
  end
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

graph = Board.new

p graph.neighbor_cells
