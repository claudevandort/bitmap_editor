require 'validatable'
require 'commands/show'

context Show do
  it 'fails if gets called with params' do
    command = Show.new 1
    command.validate
    expect(command.error_message).to match /Expected 0 params/
  end
end
