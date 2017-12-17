require 'active_support/all'
require 'validatable'
Dir["./lib/commands/*.rb"].each {|file| require file }
require 'command_file'
require 'bitmap_editor'

context BitmapEditor do
  subject(:editor) { BitmapEditor.new(verbose: false) }
  it 'requires an argument' do
    expect(editor.run(nil)).to be false
  end

  it 'requires a existing file' do
    nonexistent_file_path = 'examples/this_file_doesnt_exists.txt'
    expect(editor.run(nonexistent_file_path)).to be false
  end
  it 'commands have a valid name' do
    file_with_invalid_commands = 'examples/invalid_commands.txt'
    editor.run(file_with_invalid_commands)
    expect(editor.error_message).to match /Unrecognised command/
  end
end
