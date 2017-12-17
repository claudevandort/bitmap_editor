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
    self.errors = []
    filtered_validations = if args.any?
      if validations.include? args[0]
        {method: args[0], args: args[1..-1]}
      else
        raise ArgumentError, "Validation Error: #{args[0]} method not found"
      end
    else
      validations
    end
    filtered_validations.each do |val|
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

  def validations
    []
  end
end
