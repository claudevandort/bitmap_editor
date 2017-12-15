require 'command_file'

describe CommandFile do
  it 'requires a file path' do
    file = CommandFile.new(nil)
    file.validate
    expect(file.errors.first.message).to eq 'Please provide a file'
  end
  it 'requires a valid file path' do
    nonexistent_file_path = 'examples/this_file_doesnt_exists.txt'
    file = CommandFile.new(nonexistent_file_path)
    file.validate
    expect(file.errors.first.message).to eq 'Please provide an existing file'
  end
end
