class DrawPixel
  include Validatable
  NAME = 'L'
  LONG_NAME = 'Draw Pixel'
  PARAMS_COUNT = 3
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end

  def validations
    %w{
      valid_params_count
    }
  end

  def valid_params_count
    raise StandardError, "Expected #{PARAMS_COUNT} params, found #{params.count}" if params.count != PARAMS_COUNT
  end
end
