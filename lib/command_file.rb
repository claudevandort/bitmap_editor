class CommandFile
  attr_accessor :path, :errors, :output
  VALIDATIONS = %w{
    path_is_defined
    path_is_valid
    file_is_not_empty
    command_manes_are_valid
    space_after_command_name
  }

  def initialize(file_path)
    self.path = file_path
  end

  def valid?
    validate
    errors.empty?
  end

  def each
    File.open(path).each do |line|
      array = line.chomp.split ' '
      response = {command: array[0], params: array[1..-1]}
      yield response
    end if valid?
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
    File.open(path).each_with_index do |line, index|
      return raise StandardError, "Unrecognised command #{line[0]} in line #{index+1}" if /[ICLVHS]/.match(line[0]).nil?
    end if valid_file?
  end

  def space_after_command_name
    File.open(path).each do |line|
      unless /[ILVH]/.match(line[0]).nil?
        return raise StandardError, "There's not a space after the command #{line[0]}" unless line[1] == ' '
      end
    end if valid_file?
  end
end
