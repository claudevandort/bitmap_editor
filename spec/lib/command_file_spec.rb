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
=begin
  it 'lines have a valid command name' do
    file = CommandFile.new 'examples/invalid_commands.txt'
    file.validate
    expect(file.error_message).to match /Unrecognised command/
  end
  it 'requires whitespace separation after all command names' do
    file = CommandFile.new 'examples/params_missing_separation.txt'
    file.validate
    expect(file.error_message).to match /There's not a space after the command/
  end
=end
  context 'new image command' do
    it 'has two params'
    context 'first param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'second param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
  end
  context 'clear command' do
    it 'has no params'
  end
  context 'colour pixel command' do
    it 'has three params'
    context 'first param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'second param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'third param' do
      it 'is a character'
      it 'is a capital letter'
    end
  end
  context 'draw vertical segment command' do
    it 'has four params'
    context 'first param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'second param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'third param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'fourth param' do
      it 'is a character'
      it 'is a capital letter'
    end
  end
  context 'draw horizontal segment command' do
    it 'has four params'
    context 'first param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'second param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'third param' do
      it 'is a number'
      it 'is in the range 1..250'
    end
    context 'fourth param' do
      it 'is a character'
      it 'is a capital letter'
    end
  end
  context 'show command' do
    it 'has no params'
  end
end
