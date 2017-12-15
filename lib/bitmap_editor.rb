class BitmapEditor
  attr_accessor :verbose, :file

  def initialize(verbose: true)
    self.verbose = verbose
  end

  def run(file_path)
    file = CommandFile.new file_path
    unless file.valid?
      file.show_error if verbose
      return false
    end

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        puts 'There is no image'
      else
        puts 'unrecognised command :('
      end
    end
  end
end
