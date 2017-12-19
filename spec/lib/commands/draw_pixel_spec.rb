require 'validatable'
require 'bitmap'
require 'commands/draw_pixel'

context DrawPixel do
  it 'has three params' do
    command = DrawPixel.new 1, 2, 'A', 'B'
    command.validate
    expect(command.error_message).to match /Expected 3 params/
  end
  context 'first param' do
    it 'requires a number' do
      command = DrawPixel.new 'x', 2, 'A'
      command.validate
      expect(command.error_message).to eq 'First param is not an integer'
    end
    it 'is in the range 1..250' do
      command = DrawPixel.new 251, 1, 'A'
      command.validate
      expect(command.error_message).to eq 'First param is not within the allowed range'
    end
  end
  context 'second param' do
    it 'requires a number' do
      command = DrawPixel.new 1, 'x', 'A'
      command.validate
      expect(command.error_message).to eq 'Second param is not an integer'
    end
    it 'is in the range 1..250' do
      command = DrawPixel.new 1, 251, 'A'
      command.validate
      expect(command.error_message).to eq 'Second param is not within the allowed range'
    end
  end
  context 'third param' do
    it 'requires a String' do
      command = DrawPixel.new 1, 2, 3
      command.validate
      expect(command.error_message).to eq 'Third param is not a String'
    end
    it 'is only one character long' do
      command = DrawPixel.new 1, 2, 'AB'
      command.validate
      expect(command.error_message).to eq 'Third param is not one character long'
    end
    it 'is a capital letter' do
      command = DrawPixel.new 1, 2, 'u'
      command.validate
      expect(command.error_message).to eq 'Third param is not a capital letter'
    end
  end
  it 'draws the specified color in the given position'
end
