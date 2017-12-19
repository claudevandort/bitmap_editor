require 'validatable'
require 'bitmap'
require 'commands/new_image'
require 'commands/draw_horizontal'

context DrawHorizontal do
  it 'has four params' do
    command = DrawHorizontal.new 1, 2, 3, 'A', 'B'
    command.validate
    expect(command.error_message).to match /Expected 4 params/
  end
  context 'first param' do
    it 'requires a number' do
      command = DrawHorizontal.new 'x', 2, 3, 'A'
      command.validate
      expect(command.error_message).to eq 'First param is not an integer'
    end
    it 'is in the range 1..250' do
      command = DrawHorizontal.new 251, 2, 3, 'A'
      command.validate
      expect(command.error_message).to eq 'First param is not within the allowed range'
    end
  end
  context 'second param' do
    it 'requires a number' do
      command = DrawHorizontal.new 1, 'x', 3, 'A'
      command.validate
      expect(command.error_message).to eq 'Second param is not an integer'
    end
    it 'is in the range 1..250' do
      command = DrawHorizontal.new 1, 251, 3, 'A'
      command.validate
      expect(command.error_message).to eq 'Second param is not within the allowed range'
    end
  end
  context 'third param' do
    it 'requires a number' do
      command = DrawHorizontal.new 1, 2, 'x', 'A'
      command.validate
      expect(command.error_message).to eq 'Third param is not an integer'
    end
    it 'is in the range 1..250' do
      command = DrawHorizontal.new 1, 2, 251, 'A'
      command.validate
      expect(command.error_message).to eq 'Third param is not within the allowed range'
    end
  end
  context 'fourth param' do
    it 'requires a String' do
      command = DrawHorizontal.new 1, 2, 3, 4
      command.validate
      expect(command.error_message).to eq 'Fourth param is not a String'
    end
    it 'is only one character long' do
      command = DrawHorizontal.new 1, 2, 3, 'AB'
      command.validate
      expect(command.error_message).to eq 'Fourth param is not one character long'
    end
    it 'is a capital letter' do
      command = DrawHorizontal.new 1, 2, 3, 'u'
      command.validate
      expect(command.error_message).to eq 'Fourth param is not a capital letter'
    end
  end
  it 'draws the specified color in the given segment' do
    bitmap = NewImage.new(5, 6).run
    x1 = 2; x2 = 3; y = 4; color = 'A'
    bitmap = DrawHorizontal.new(x1, x2, y, color).run bitmap
    (x1..x2).each do |x|
      expect(bitmap.get(x, y)).to eq color
    end
  end
end
