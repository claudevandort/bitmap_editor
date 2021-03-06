class Show
  include Validatable
  NAME = 'S'
  LONG_NAME = 'Show'
  PARAMS_COUNT = 0
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end

  def run(bitmap)
    bitmap.show
    bitmap
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
