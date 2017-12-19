class Bitmap
  attr_accessor :matrix
  def initialize(width, heigth)
    self.matrix = Array.new(width){Array.new(heigth){'O'}}
  end

  def width
    matrix.count
  end

  def heigth
    matrix[0].count
  end

  def print
    matrix.each do |x|
      y.each do |y|
        puts matrix[x][y]
      end
    end
  end
end
