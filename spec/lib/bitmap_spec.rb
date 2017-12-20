require 'active_support/all'
require 'validatable'
Dir["./lib/commands/*.rb"].each {|file| require file }
require 'bitmap'

context Bitmap do
  it "doesn't allow out of bounds editions" do
    bitmap = Bitmap.new 4, 4
    bitmap = DrawPixel.new(5, 5, 'A').run bitmap
    expect(bitmap.error_message).to eq "You're trying to edit a pixel that doesn't exists"
  end
end
