class Bitmap
  attr_accessor :matrix
  def initialize(width, heigth)
    self.matrix = Array.new(heigth){Array.new(width){'O'}}
  end

  def width
    matrix[0].count
  end

  def heigth
    matrix.count
  end

  def show
    matrix.each do |column|
      column.each do |row|
        print row
      end
      puts ''
    end
  end
end
