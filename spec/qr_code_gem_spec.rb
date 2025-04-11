require "spec_helper"
require 'mini_magick'
require 'qr_code_gem'

RSpec.describe QrCodeGem do
  describe ".encode" do
    let(:text) { "This is a test QR code." }
    let(:filename) { "test_qr_code.png" }

    after do
      File.delete(filename) if File.exist?(filename)
    end

    it "generates a QR code image file" do
      filepath = described_class.encode(text, filename)
      expect(File.exist?(filepath)).to be true
    end

    it "generates a valid PNG image" do 
      filepath = described_class.encode(text, filename)
      image = nil
      begin
        image = MiniMagick::Image.open(filepath)
        expect(image[:format]).to eq('PNG')
        image.destroy!
      rescue MiniMagick::Error => e
        fail "MiniMagick error: #{e.message}"
      end
    end
  end

  describe ".decode" do
    let(:original_text) { "This is a test QR code to decode.  Exact match required!" }
    let(:filename) { "test_qr_code_decode.png" } 
    let(:invalid_filename) { "not_a_qr_code.jpg" }

    before do
     
      QrCodeGem.encode(original_text, filename)
    end

    after do
      File.delete(filename) if File.exist?(filename)
      File.delete(invalid_filename) if File.exist?(invalid_filename)
    end

    it "decodes a valid QR code image and matches the original text" do
      decoded_qr = described_class.decode(filename)
      expect(decoded_qr).not_to be_nil
      expect(decoded_qr).to eq(original_text)
    end

    it "returns nil if the image is not a valid QR code" do
      File.write(invalid_filename, "not a qr code")
      decoded_text = described_class.decode(invalid_filename)
      expect(decoded_text).to be_nil
    end
  end
end
