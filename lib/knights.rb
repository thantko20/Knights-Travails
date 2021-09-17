class Knight
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
    array.select { |move| cells.include?(move)}
  end

  def cells
    (0..7).to_a.product (0..7).to_a
  end
end

knight = Knight.new([0,0])
p knight.legal_moves