# frozen_string_literal: true

# kata 02 Game of life iteration 3 units test
class Grid
  def initialize(hei, wid)
    @height = hei
    @width = wid
    @matrix = Array.new(@height) { Array.new(@width) }
    @matrix2 = Array.new(@height) { Array.new(@width) }
  end

  def generate
    (0..(@height - 1)).each do |h|
      (0..(@width - 1)).each do |w|
        @matrix2[h][w] = 0
        @matrix[h][w] = if [0, 1, 2].include?(rand(4))
                          0
                        else
                          1
                        end
      end
    end
  end

  def print_matriz(matriz)
    (0..(@height - 1)).each do |h|
      (0..(@width - 1)).each do |w|
        if matriz[h][w].zero?
          print '.'
        else
          print '*'
        end
      end
      puts
    end
  end
  attr_reader :matrix, :matrix2
end

grid = Grid.new(5, 6)

grid.generate
# matriz = grid.matrix
grid.print_matriz(grid.matrix)
puts
grid.print_matriz(grid.matrix2)
