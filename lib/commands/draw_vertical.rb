class DrawVertical
  include Validatable
  NAME = 'V'
  LONG_NAME = 'Draw Vertical'
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end
end
