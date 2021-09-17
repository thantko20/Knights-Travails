module Creatable
  def board_cells
    (0..7).to_a.product (0..7).to_a
  end
end