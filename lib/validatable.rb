module Validatable
  attr_accessor :errors

  def error_message
    errors.first.message if errors.any?
  end

  def show_error
    puts error_message if errors.any?
  end

  def valid?(*args)
    validate *args
    errors.empty?
  end

  def validate(*args)
    validate_args(*args) do |val|
      begin
        if val.is_a? Hash
          send val[:method], *val[:args]
        else
          send val
        end
      rescue StandardError => e
        errors << e
      end
    end
  end

  def validate!(*args)
    validate_args(*args) do |val|
      if val.is_a? Hash
        send val[:method], *val[:args]
      else
        send val
      end
    end
  end

  def validate_args(*args)
    self.errors = []
    filtered_validations = []
    if args.any?
      if validations.include? args[0].to_s
        filtered_validations << {method: args[0], args: args[1..-1]}
      else
        raise ArgumentError, "Validation Error: #{args[0]} method not found"
      end
    else
      filtered_validations = validations
    end
    filtered_validations.each do |val|
      yield val
    end
  end

  def validations
    []
  end
end
