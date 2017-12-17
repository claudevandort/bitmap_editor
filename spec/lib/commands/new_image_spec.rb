require 'validatable'
require 'commands/new_image'

context NewImage do
  it 'has two params' do
    command = NewImage.new 1, 2, 3
    command.validate
    expect(command.error_message).to match /Expected 2 params/
  end
  context 'first param' do
    it 'is a number'
    it 'is in the range 1..250'
  end
  context 'second param' do
    it 'is a number'
    it 'is in the range 1..250'
  end
end
