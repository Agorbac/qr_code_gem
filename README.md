
# QrCodeGem⚙️

**QrCodeGem** — это Ruby-гем для генерации и распознавания QR-кодов. Он использует библиотеки RQRCode, MiniMagick и Qrio для создания изображений QR-кодов и их распознавания из файлов.


## 👥 Команда Разработчиков

- Алёна Горбачёва 
- Дмитрий Ткачёв
- Андрей Сивцов
- Владимир Карабанов
- Дмитрий Проскуряков

## 🎯 Цель проекта

Создание библиотеки для работы с QR-кодами в Ruby:

- Генерация QR-кодов из произвольного текста и сохранение в изображения (`.png`).
- Распознавание QR-кодов с изображений и извлечение текста.
- Обработка временных файлов с автоматическим удалением после завершения работы.

Проект подходит для локального использования, а также для встраивания в более крупные Ruby/Rails приложения.


## 🧱 Технологический стек

- **Язык:** Ruby
- **Библиотеки:**
  - `rqrcode` — генерация QR-кодов
  - `mini_magick` — обработка изображений
  - `chunky_png` — работа с PNG-форматом
  - `qrio` — распознавание QR-кодов

## 💻 Установка

Для установки гем можно использовать Bundler или `gem`:

1. Через Bundler:

```bash
bundle add qr_code_gem
```
2. Если Bundler не используется, установите гем с помощью:

```bash
gem install qr_code_gem
```

## 🚀 Использование

**Генерация QR-кода**

Для генерации QR-кода из текста и сохранения его в PNG-формате:

```ruby
# Подключаем библиотеку
require 'qr_code_gem'

# Генерируем QR-код
filename = QrCodeGem.encode("Текст для QR-кода", "qr_code.png")

puts "QR-код сохранен в: #{filename}"
```
Этот код создаст файл qr_code.png, содержащий QR-код с переданным текстом.

**Распознавание QR-кода**

Для декодирования текста из изображения, содержащего QR-код:

```ruby
# Подключаем библиотеку
require 'qr_code_gem'

# Декодируем QR-код с изображения
decoded_text = QrCodeGem.decode("qr_code.png")

if decoded_text
  puts "Текст, закодированный в QR-коде: #{decoded_text}"
else
  puts "QR-код не найден или не удалось его распознать."
end
```

## ⚡️ Запуск проекта

1. Для запуска проекта переходим в директорию `\lib`:

```bash
gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG
```

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/qr_code_gem.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
=======
# qr_code_gem
The best qr_code_gem
>>>>>>> df58dd8c3be33ad709a811a86d626470603a685e
