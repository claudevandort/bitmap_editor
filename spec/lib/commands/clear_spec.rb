require 'validatable'
require 'commands/clear'

context Show do
  it 'fails if gets called with params' do
    command = Clear.new 1
    command.validate
    expect(command.error_message).to match /Expected 0 params/
  end
  it 'clears the whole image' do
    bitmap = NewImage.new(5, 6).run
    bitmap = DrawPixel.new(2, 3, 'P').run bitmap
    bitmap = DrawVertical.new(2, 3, 4, 'V').run bitmap
    bitmap = DrawHorizontal.new(2, 3, 4, 'H').run bitmap
    bitmap = Clear.new.run bitmap
    (1..bitmap.heigth).each do |y|
      (1..bitmap.width).each do |x|
        expect(bitmap.get(x, y)).to eq 'O'
      end
    end
  end
end
