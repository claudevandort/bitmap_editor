class BitmapEditor
  attr_accessor :verbose, :file, :commands

  def initialize(verbose: true)
    self.verbose = verbose
    register_commands
  end

  def run(file_path)
    file = CommandFile.new file_path

    unless file.valid?
      file.show_error if verbose
      return false
    end

    file.each do |line|
      case line[:command]
      when 'I'
        puts 'New Image'
      when 'C'
        puts 'Clear'
      when 'L'
        puts 'Color pixel'
      when 'V'
        puts 'Draw vertical'
      when 'H'
        puts 'Draw horizontal'
      when 'S'
        puts 'Show'
      else
        puts 'unrecognised command :('
      end
    end
=begin
    File.open(file).each do |line|
      line = line.chomp
      case line
      when 'S'
        puts 'There is no image'
      else
        puts 'unrecognised command :('
      end
    end
=end
  end

  def register_commands
    self.commands = {}
    Dir.glob('lib/commands/*.rb').each do |file|
      klass = file.split('/')[-1][0..-4].humanize.titleize.tr(' ', '').constantize
      commands[klass::NAME] = klass
    end
  end
end
