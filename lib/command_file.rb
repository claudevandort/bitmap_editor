class CommandFile
  include Validatable
  attr_accessor :path, :output

  def initialize(file_path)
    self.path = file_path
  end

  def each
    File.open(path).each do |line|
      array = line.chomp.split ' '
      response = {command: array[0], params: array[1..-1]}
      yield response
    end if valid?
  end

  def validations
    %w{
      path_is_defined
      path_is_valid
      file_is_not_empty
    }
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
end
