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
      puts line[:command]
      unless valid?(:command_exists, line[:command]) and
        valid?(:first_new_image) and
        valid?(:last_shows)
        show_error if verbose
        return false
      end

      command = commands[line[:command]].new(*line[:params])
      unless command.valid?
        command.show_error if verbose
        return false
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
      last_shows
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

  def last_shows
    file.each_with_index do |line, index|
      if index == (file.count-1) and line[:command] != 'S'
        raise StandardError, 'The last command needs to show the image'
      end
    end
  end
end
