lib = File.expand_path(__dir__)
puts lib
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'set'

require 'pdf417/barcode_config'
require 'pdf417/text_compactor'
require 'pdf417/number_compactor'
require 'pdf417/compaction_manager'
require 'pdf417/error_correction'
require 'pdf417/barcode_matrix'
require 'pdf417/high_level_encoder'
require 'pdf417/low_level_encoder'
require 'pdf417/barcode_painter'
require 'pdf417/canvases/svg'

module PDF417

  def self.generate(message, options={})

    columns = options[:columns] || 5
    security_level = options[:security_level] || 0

    config = BarcodeConfig.new(message: message, columns: columns, security_level: security_level)
    high_encoder = HighLevelEncoder.new(config)
    low_encoder = LowLevelEncoder.new(high_encoder.encode)
    painter = BarcodePainter.new(low_encoder.encode, Canvases::SVG.new)
    painter.paint
    painter.canvas
  end

  class MessageNotCompactable < StandardError; end
end
