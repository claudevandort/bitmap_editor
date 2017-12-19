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

  def show(*args)
    each_with_index do |color, row_index, column_index, row|
      print color
      puts '' if column_index == (row.length - 1)
      matrix
    end if args.count.zero?
    if args.count == 2
      puts get(args[0], args[1])
    end
  end

  def get(x, y)
    matrix[y - 1][x - 1]
  end

  def set_color(x, y, color)
    matrix[y-1][x-1] = color
  end

  def each_with_index
    matrix.each_with_index do |row, row_index|
      row.each_with_index do |column, column_index|
        yield column, row_index, column_index, row
      end
    end
  end
end
