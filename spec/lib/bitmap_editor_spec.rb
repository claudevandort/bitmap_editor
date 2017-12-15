require 'command_file'
require 'bitmap_editor'

describe BitmapEditor do
  it 'requires an argument' do
    expect(BitmapEditor.new.run(nil)).to be false
  end

  it 'requires a existing file' do
    nonexistent_file_path = 'examples/this_file_doesnt_exists.txt'
    expect(BitmapEditor.new.run(nonexistent_file_path)).to be false
  end
end
