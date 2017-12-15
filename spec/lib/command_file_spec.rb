require 'command_file'

context CommandFile do
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

  it 'file is not empty'
  it 'file lines have a valid command name'
  it 'commands\'s params are separated with a whitespace'
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
