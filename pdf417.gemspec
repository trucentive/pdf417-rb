Gem::Specification.new do |s|
  s.name         = 'pdf417-rb'
  s.version      = '0.0.2'
  s.date         = '2019-04-02'
  s.platform     = Gem::Platform::RUBY
  s.summary      = "A Ruby PDF417 barcode encoder gem"
  s.description  = "Generate PDF417 barcodes in SVG format. Forked from https://github.com/bnix/pdf417-rb."
  s.authors      = ["Bryan Nix (original)", "Brian Moran (gem)"]
  s.email        = 'brian.moran@gmail.com'
  s.files        = Dir["{lib}/**/*.rb", "{lib}/**/canvases/*.rb", "{spec}/**/*.rb", "{spec}/**/**/*.rb","LICENSE", "*.md", "example_barcode.svg" ]
  s.require_path = 'lib'
  s.homepage     = 'https://github.com/bmo/pdf417-rb'
  s.license      = 'MIT'
end