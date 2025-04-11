
RSpec.configure do |config|
  config.before(:suite) do
    begin
      require 'mini_magick'

      puts "MiniMagick loaded and functional!"
      image.destroy!
    rescue LoadError => e
      puts "MiniMagick LoadError: #{e.message}"
    rescue => e
      puts "MiniMagick Error: #{e.message}"
    end
  end
end