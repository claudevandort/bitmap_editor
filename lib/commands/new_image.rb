class NewImage
  include Validatable
  NAME = 'I'
  LONG_NAME = 'New Image'
  PARAMS_COUNT = 2
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
