class BitmapEditor

  def run(file)
    if file.nil? || !File.exists?(file)
      puts 'please provide correct file'
      return false
    end

    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
          puts "There is no image"
      else
          puts 'unrecognised command :('
      end
    end
  end
end
