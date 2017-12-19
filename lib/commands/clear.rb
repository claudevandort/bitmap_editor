class Clear
  include Validatable
  NAME = 'C'
  LONG_NAME = 'Clear'
  PARAMS_COUNT = 0
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
