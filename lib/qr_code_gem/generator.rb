require 'rqrcode'

module QrCodeGem
  class Generator
    def self.generate(text, options = {})
      level = options[:level] || :h  # Уровень коррекции ошибок (L, M, Q, H)
      size = options[:size] || 5      # Размер модуля QR-кода

      qrcode = RQRCode::QRCode.new(text, :level => level.to_sym, :size => size)

      # Возвращаем SVG как строку по умолчанию
      qrcode.as_svg
    end

    def self.generate_png(text, filename, options = {})
      require 'chunky_png'  # Добавьте chunky_png в Gemfile, если используете

      level = options[:level] || :h
      size = options[:size] || 5
      pixels_per_module = options[:pixels_per_module] || 10

      qrcode = RQRCode::QRCode.new(text, :level => level.to_sym, :size => size)

      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_modules: false,
        file: filename,
        module_px_size: pixels_per_module
      )

      #png.save(filename)  # Сохранять здесь не нужно, уже сохранено в file: filename
    end
  end
end