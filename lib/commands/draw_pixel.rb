class DrawPixel
  include Validatable
  NAME = 'L'
  LONG_NAME = 'Draw Pixel'
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end
end
