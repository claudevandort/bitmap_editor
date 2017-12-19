class DrawVertical
  include Validatable
  NAME = 'V'
  LONG_NAME = 'Draw Vertical'
  PARAMS_COUNT = 4
  attr_accessor :params

  def initialize(*params)
    self.params = params
  end

  def run(bitmap)
    x = params[0].to_i; y1 = params[1].to_i; y2 = params[2].to_i; color = params[3]
    (y1..y2).each do |y|
      bitmap.set_color x, y, color
    end
    bitmap
  end

  def validations
    %w{
      valid_params_count
      first_param_is_an_integer
      first_param_is_within_allowed_range
      second_param_is_an_integer
      second_param_is_within_allowed_range
      third_param_is_an_integer
      third_param_is_within_allowed_range
      fourth_param_is_a_string
      fourth_param_is_one_char_long
      fourth_param_is_a_capital_letter
    }
  end

  def valid_params_count
    raise StandardError, "Expected #{PARAMS_COUNT} params, found #{params.count}" if params.count != PARAMS_COUNT
  end

  def first_param_is_an_integer
    raise StandardError, 'First param is not an integer' if params[0].to_s.match(/\D/).present?
  end

  def first_param_is_within_allowed_range
    raise StandardError, 'First param is not within the allowed range' unless params[0].to_i.between? NewImage::MIN_SIZE, NewImage::MAX_SIZE
  end

  def second_param_is_an_integer
    raise StandardError, 'Second param is not an integer' if params[1].to_s.match(/\D/).present?
  end

  def second_param_is_within_allowed_range
    raise StandardError, 'Second param is not within the allowed range' unless params[1].to_i.between? NewImage::MIN_SIZE, NewImage::MAX_SIZE
  end

  def third_param_is_an_integer
    raise StandardError, 'Third param is not an integer' if params[2].to_s.match(/\D/).present?
  end

  def third_param_is_within_allowed_range
    raise StandardError, 'Third param is not within the allowed range' unless params[2].to_i.between? NewImage::MIN_SIZE, NewImage::MAX_SIZE
  end

  def fourth_param_is_a_string
    raise StandardError, 'Fourth param is not a String' unless params[3].is_a? String
  end

  def fourth_param_is_one_char_long
    raise StandardError, 'Fourth param is not one character long' unless params[3].length == 1
  end

  def fourth_param_is_a_capital_letter
    raise StandardError, 'Fourth param is not a capital letter' unless params[3].match(/[^A-Z]/).nil?
  end
end
