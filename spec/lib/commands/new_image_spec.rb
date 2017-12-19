require 'validatable'
require 'bitmap'
require 'commands/new_image'

context NewImage do
  it 'has two params' do
    command = NewImage.new 1, 2, 3
    command.validate
    expect(command.error_message).to match /Expected 2 params/
  end
  context 'first param' do
    it 'requires a number' do
      command = NewImage.new 'a', 1
      command.validate
      expect(command.error_message).to eq 'First param is not an integer'
    end
    it 'is in the range 1..250' do
      command = NewImage.new 251, 1
      command.validate
      expect(command.error_message).to eq 'First param is not within the allowed range'
    end
  end
  context 'second param' do
    it 'requires a number' do
      command = NewImage.new 1, 'b'
      command.validate
      expect(command.error_message).to eq 'Second param is not an integer'
    end
    it 'is in the range 1..250' do
      command = NewImage.new 1, 251
      command.validate
      expect(command.error_message).to eq 'Second param is not within the allowed range'
    end
  end
  it '.run returns a Bitmap' do
    command = NewImage.new 50, 100
    bitmap = command.run
    expect(bitmap).to be_a Bitmap
  end
  it '.run creates a Bitmap of width M' do
    command = NewImage.new 50, 100
    bitmap = command.run
    expect(bitmap.width).to eq 50
  end
  it '.run creates a Bitmap of heigth N' do
    command = NewImage.new 50, 100
    bitmap = command.run
    expect(bitmap.heigth).to eq 100
  end
end
