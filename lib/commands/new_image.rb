class NewImage
  include Validatable
  NAME = 'I'
  LONG_NAME = 'New Image'
  PARAMS_COUNT = 2
  MIN_SIZE = 1
  MAX_SIZE = 250
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end

  def run
    Bitmap.new params[0].to_i, params[1].to_i
  end

  def validations
    %w{
      valid_params_count
      first_param_is_an_integer
      first_param_is_within_allowed_range
      second_param_is_an_integer
      second_param_is_within_allowed_range
    }
  end

  def valid_params_count
    raise StandardError, "Expected #{PARAMS_COUNT} params, found #{params.count}" if params.count != PARAMS_COUNT
  end

  def first_param_is_an_integer
    raise StandardError, 'First param is not an integer' if params[0].to_s.match(/\D/).present?
  end

  def first_param_is_within_allowed_range
    raise StandardError, 'First param is not within the allowed range' unless params[0].to_i.between? MIN_SIZE, MAX_SIZE
  end

  def second_param_is_an_integer
    raise StandardError, 'Second param is not an integer' if params[1].to_s.match(/\D/).present?
  end

  def second_param_is_within_allowed_range
    raise StandardError, 'Second param is not within the allowed range' unless params[1].to_i.between? MIN_SIZE, MAX_SIZE
  end
end
