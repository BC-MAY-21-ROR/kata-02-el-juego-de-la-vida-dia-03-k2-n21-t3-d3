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

  def next_generation
    generate
    print "\n\n"
    print_matriz(@matrix)
    print "\n\n"
    (0..@height - 2).each do |h|
      (0..@width - 2).each do |w|
        cells_rules(h, w, neighbors(h, w))
      end
    end
    print_matriz(@matrix2)
  end

  def neighbors(hei, wid)
    cells_around = 0
    (-1..1).each do |h| # height y/a
      (-1..1).each do |w| # width x/b
        a = hei + h
        b = wid + w
        cells_around += @matrix[a][b] if a >= 0 || b >= 0
      end
    end
    cells_around -= @matrix[hei][wid]
  end

  def cells_rules(hei, wid, neighbors)
    @matrix2[hei][wid ] = if @matrix[hei][wid] == 1 && neighbors < 2
                            0
                          elsif @matrix[hei][wid] == 1 && neighbors > 3
                            0
                          elsif @matrix[hei][wid].zero? && neighbors == 3
                            1
                          else
                            @matrix[hei][wid]
                          end
  end
  # attr_reader :matrix, :matrix2
end

require 'rspec/autorun'

describe Grid do
  it '5  and 6' do
    grid = Grid.new(5, 6)
    expect(grid.next_generation)
  end
  it '7 and 9' do
    grid = Grid.new(7, 9)
    expect(grid.next_generation)
  end
end
