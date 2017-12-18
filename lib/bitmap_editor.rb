class BitmapEditor
  include Validatable
  attr_accessor :verbose, :file, :commands

  def initialize(verbose: true)
    self.verbose = verbose
    register_commands
  end

  def run(file_path)
    self.file = CommandFile.new file_path

    unless file.valid?
      file.show_error if verbose
      return false
    end

    file.each_with_index do |line, index|
      unless valid?(:command_exists, line[:command]) and
        valid?(:first_new_image)
        show_error if verbose
        return false
      end

      command = commands[line[:command]].new(*line[:params])

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
  end

  def register_commands
    self.commands = {}
    Dir.glob('lib/commands/*.rb').each do |file|
      klass = file.split('/')[-1][0..-4].humanize.titleize.tr(' ', '').constantize
      commands[klass::NAME] = klass
    end
  end

  def validations
    %w{
      command_exists
      first_new_image
    }
  end

  def command_exists(command)
    unless command.match(%r"[#{commands.keys.join}]").present?
      raise StandardError, "Unrecognised command #{command} :("
    end
  end

  def first_new_image
    file.each_with_index do |line, index|
      if index.zero? and line[:command] != 'I'
        raise StandardError, 'The first command needs to create an image'
      end
    end
  end
end
