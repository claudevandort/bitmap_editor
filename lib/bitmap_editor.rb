class BitmapEditor
  attr_accessor :file

  def run(file)
    self.file = CommandFile.new file
    unless self.file.valid?
      puts self.file.errors.first.message
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
