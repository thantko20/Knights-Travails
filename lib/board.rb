# frozen_string_literal: true

require_relative 'board_cells'
require_relative 'knights'

class Board
  include Creatable
  attr_accessor :neighbor_cells

  def initialize
    @neighbor_cells = add_each_cell_neighbors
  end

  def knight_moves(curr, dest)
    queue = []
    queue.push(curr)

    visited = []
    visited.push(curr)

    predecessors_track = []
    fifo(queue, dest, visited, predecessors_track)
    construct_path(predecessors_track)
  end

  def construct_path(predecessors_track)
    arr = []
    curr_child = predecessors_track.first.last
    arr.push(curr_child)

    predecessors_track.each do |relation|
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

  def fifo(queue, dest, visited, predecessors_track)
    until queue.empty?
      node = queue.shift
      moves = @neighbor_cells[node]
      moves.each do |move|
        next if visited.include?(move)

        queue.push(move)
        visited.push(move)
        predecessors_track.unshift([node, move])
        break if check_dest(queue, move, dest)
      end
    end
  end

  def check_dest(queue, move, dest)
    if move == dest
      queue.clear
      return true
    end
    false
  end
end

graph = Board.new

p graph.knight_moves([3, 3], [4, 4])
