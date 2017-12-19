require 'validatable'
require 'bitmap'
require 'commands/draw_pixel'

context DrawPixel do
  it 'has three params'
  context 'first param' do
    it 'requires a number'
    it 'is in the range 1..250'
  end
  context 'second param' do
    it 'requires a number'
    it 'is in the range 1..250'
  end
  context 'third param' do
    it 'requires a String'
    it 'is only one character long'
    it 'is a capital letter'
  end
  it 'draws the specified color in the given position'
end
