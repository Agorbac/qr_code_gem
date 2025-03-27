require "qr_code_gem"
require "qr_code_gem/decoder"

RSpec.describe QrCodeGem::Decoder do
  it "пытается декодировать изображение с QR-кодом" do
    # Убедитесь, что файл test.png существует и содержит QR-код,
    # который вы хотите декодировать.  Путь должен быть относительным
    # от корня вашего проекта.
    result = QrCodeGem::Decoder.decode_image("spec/qr_code_gem/test.png")
    expect(result).not_to be_nil, "Результат декодирования не должен быть nil, если QR-код найден."
    expect(result).to be_a(String), "Результат декодирования должен быть строкой."
    puts "Декодированный QR-код: #{result}" if result # Выводим результат для отладки.
  end

  it "возвращает nil, если QR-код не найден в изображении" do
    # Создаем фиктивное изображение без QR-кода.
    # Это позволяет проверить, что декодер правильно обрабатывает
    # случаи, когда QR-код отсутствует.  Важно, чтобы изображение
    # действительно не содержало QR-кода.
    Magick::Image.new(100, 100) { self.background_color = 'white' }.write("spec/qr_code_gem/no_qr.png")

    result = QrCodeGem::Decoder.decode_image("spec/qr_code_gem/no_qr.png")
    expect(result).to be_nil, "Результат декодирования должен быть nil, если QR-код отсутствует."
  end
end
