
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
cd lib
```

2. Запустите код для генерации QR-кода:

```bash
irb
> require_relative "qr_code_gem"
> QrCodeGem.encode("Текст")
```

3. Запустите код для распознавания QR-кода:

```bash
> QrCodeGem.decode("Название файла")
```

4. Наслаждаемся работой прекрасного Gem`a 🙂


## 📝 Лицензия

Проект лицензирован на условиях [MIT License](https://opensource.org/licenses/MIT).
=====