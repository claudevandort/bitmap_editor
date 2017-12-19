class DrawHorizontal
  include Validatable
  NAME = 'H'
  LONG_NAME = 'Draw horizontal'
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end
end
