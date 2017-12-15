class CommandFile
  attr_accessor :path, :errors
  VALIDATIONS = %w{
    path_is_defined
    path_is_valid
  }

  def initialize(file_path)
    self.path = file_path
  end

  def valid?
    validate
    errors.empty?
  end

  def validate
    self.errors = []
    VALIDATIONS.each do |val|
      begin
        send val
      rescue ArgumentError => e
        errors << e
      end
    end
  end

  def show_error
    puts errors.first.message if errors.any?
  end

  def path_is_defined
    raise ArgumentError, 'Please provide a file' if path.nil?
  end

  def path_is_valid
    raise ArgumentError, 'Please provide an existing file' unless !path.nil? and File.exists?(path)
  end
end
