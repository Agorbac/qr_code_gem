# frozen_string_literal: true

require "rqrcode"
require "mini_magick"
require "chunky_png"
require 'qrio'
require "open3"


module QrCodeGem
  class Error < StandardError; end
  def self.encode(text, filename = "qr_code.jpg")
    begin
      qrcode = RQRCode::QRCode.new(text)

      svg_file = "temp_#{Time.now.to_i}.svg"
      File.write(svg_file, qrcode.as_svg(
        offset: 0,
        color: '000',
        shape_rendering: 'crispEdges',
        module_size: 11
      ))

      image = MiniMagick::Image.open(svg_file)
      image.format("jpg")
      image.write(filename)
      image.destroy!
      
      puts "QR code saved to #{filename}"
      filename
    rescue => e
      raise Error, "Failed to generate QR code: #{e.message}"
    ensure
      File.delete(svg_file) if File.exist?(svg_file)
    end
  end
  def self.decode(image_path)
    begin

      image = MiniMagick::Image.open(image_path)

      temp_file = "temp_#{Time.now.to_i}.png"
      image.write(temp_file)

      qr = Qrio::Qr.load(temp_file)
      
      if qr && qr.qr
        puts "Decoded text: #{qr.qr.text}"
      else
        puts "QR code not detected"
        nil
      end
    rescue LoadError => e
      puts "Error: Required gem not found. Please install:"
      puts "gem install mini_magick qrio"
      nil
    rescue MiniMagick::Error => e
      puts "Image processing error: #{e.message}"
      nil
    rescue => e
      puts "QR decoding failed: #{e.message}"
      nil
    ensure
      File.delete(temp_file) if temp_file && File.exist?(temp_file)
    end
end
