# frozen_string_literal: true

require_relative "lib/qr_code_gem/version"

Gem::Specification.new do |spec|
  spec.name          = "qr_code_gem"
  spec.version       = QrCodeGem::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]

  spec.summary       = "A Ruby gem for generating and decoding QR codes."
  spec.description   = "This gem provides a simple API for generating QR codes from text or URLs and decoding QR codes from images."
  spec.homepage      = "https://github.com/your_username/qr_code_gem" # Замените на URL вашего репозитория

  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/your_username/qr_code_gem" # Замените
  spec.metadata["changelog_uri"] = "https://github.com/your_username/qr_code_gem/blob/main/CHANGELOG.md" # Замените

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rqrcode"
  spec.add_dependency "rmagick", "~> 4.0"  # Удалите require: false

  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "chunky_png"
end
