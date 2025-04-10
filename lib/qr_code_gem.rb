# frozen_string_literal: true

require "rqrcode"
require "mini_magick"
require "chunky_png"
require 'qrio'
require "open3"


module QrCodeGem
  class Error < StandardError; end
  def self.encode(text, filename = "qr_code.png")
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
      image.format("png")
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
end
