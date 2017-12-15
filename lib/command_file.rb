class CommandFile
  attr_accessor :path, :errors
  VALIDATIONS = %w{
    path_is_defined
    path_is_valid
    file_is_not_empty
    command_manes_are_valid
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
      rescue StandardError => e
        errors << e
      end
    end
  end

  def error_message
    errors.first.message if errors.any?
  end

  def show_error
    puts error_message if errors.any?
  end

  def path_is_defined
    raise ArgumentError, 'Please provide a file' if path.nil?
  end

  def path_is_valid
    raise ArgumentError, 'Please provide an existing file' unless !path.nil? and File.exists?(path)
  end

  def file_is_not_empty
    raise ArgumentError, 'Please provide a populated file' unless !path.nil? and File.exists?(path) and File.open(path).count > 0
  end

  def valid_file?
    !path.nil? and File.exists?(path) and File.open(path).count > 0
  end

  def command_manes_are_valid
    File.open(path).each do |line|
      return raise StandardError, 'File has invalid commands' if /[ICLVHS]/.match(line[0]).nil?
    end if valid_file?
  end
end
