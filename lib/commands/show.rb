class Show
  NAME = 'S'
  LONG_NAME = 'Show'
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end
end
