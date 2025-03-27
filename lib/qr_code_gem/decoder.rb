module QrCodeGem
  class Decoder
    def self.decode_image(image_path)
      begin
        require 'rqrcode'
        require 'rmagick'
      rescue LoadError => e
        if e.message.include?('rqrcode')
          raise "rqrcode gem is required to decode QR codes. Add 'gem 'rqrcode'' to your Gemfile and run bundle install."
        elsif e.message.include?('rmagick')
          raise "rmagick gem is required to decode QR codes from images.  Add 'gem 'rmagick', require: false' to your Gemfile and run bundle install."
        else
          raise e
        end
      end

      begin
        image = Magick::Image.read(image_path).first

        # Convert Magick::Image to a format rqrcode can handle
        pixels = image.export_pixels_to_str(0, 0, image.columns, image.rows, "RGB")
        width = image.columns
        height = image.rows

        # Decode the QR code using RQRCode
        qr_code = RQRCode::QRCode.decode([pixels], width: width, height: height)


        # Extract the text from the decoded QR code
        return qr_code.first.symbol.to_s if qr_code && !qr_code.empty?

      rescue Magick::ImageMagickError => e
        puts "Error decoding image: #{e.message}"
        return nil
      rescue RQRCode::QRCodeRunTimeError => e
        puts "No QR code found in the image: #{e.message}"
        return nil
      rescue => e
        puts "An unexpected error occurred: #{e.message}"
        return nil
      end
    end
  end
end