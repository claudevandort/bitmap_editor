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
end
