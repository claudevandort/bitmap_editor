require 'validatable'
require 'command_file'

context CommandFile do
  it '.new requires a file path' do
    file = CommandFile.new nil
    file.validate
    expect(file.error_message).to eq 'Please provide a file'
  end

  it '.new requires a valid file path' do
    file = CommandFile.new 'examples/this_file_doesnt_exists.txt'
    file.validate
    expect(file.error_message).to eq 'Please provide an existing file'
  end

  it '.new requires a non-empty file' do
    file = CommandFile.new 'examples/empty.txt'
    file.validate
    expect(file.error_message).to eq 'Please provide a populated file'
  end
end
