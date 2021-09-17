# frozen_string_literal: true

require_relative 'board_cells'

class Knight
  include Creatable
  attr_accessor :src, :legal_moves

  def initialize(src)
    @src = src
    @legal_moves = choose_legal_moves(gen_moves)
  end

  def gen_moves
    x = src.first
    y = src.last
    arr = []
    moves = [[-1, -2], [-1, 2], [1, -2], [1, 2],
             [-2, -1], [-2, 1], [2, -1], [2, 1]]

    moves.each do |move|
      arr.push([x + move.first, y + move.last])
    end
    arr
  end

  def choose_legal_moves(array)
    array.select { |move| board_cells.include?(move) }
  end
end
