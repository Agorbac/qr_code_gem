require "qr_code_gem"
require "qr_code_gem/generator"
require 'rqrcode' # Убедитесь, что rqrcode есть в вашем Gemfile
require 'chunky_png' # Убедитесь, что chunky_png есть в вашем Gemfile, если используете PNG тесты

RSpec.describe QrCodeGem::Generator do
  it "generates an SVG QR code" do
    text = "Hello, SVG world!"
    svg = QrCodeGem::Generator.generate(text)

    expect(svg).to include("<svg") # Проверяем, что это SVG
    expect(svg).to include('xmlns="http://www.w3.org/2000/svg"') # Проверяем пространство имен SVG
    expect(svg).to include("<rect") # QR-код состоит из rect элементов.
    expect(svg).to include('width="11"') # Проверяем ширину rect
    expect(svg).to include('height="11"') # Проверяем высоту rect
    expect(svg).to include('fill="#000"') # Проверяем цвет rect
  end

  it "generates a PNG QR code" do
    text = "Hello, PNG world!"
    filename = "test2.png"

    QrCodeGem::Generator.generate_png(text, filename)
    expect(File.exist?(filename)).to be true

    # Проверяем, что PNG имеет ненулевые размеры
    image = ChunkyPNG::Image.from_file(filename)
    expect(image.width).to be > 0
    expect(image.height).to be > 0

    #File.delete(filename) # Clean up after the test
  end
end

