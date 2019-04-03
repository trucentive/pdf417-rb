module PDF417
  class HighLevelEncoder
    PAD_CODEWORD = 900

    def initialize(barcode_config)
      @config = barcode_config
    end

    def encode
      m = compact_message(config.message)
      m = padding(m)
      m = length_descriptor(m)
      m = error_correction(m)
      BarcodeMatrix.new(m, config)
    end

    private

    attr_reader :config

    def compact_message(message)
      CompactionManager.new(message).compact
    end

    def padding(codewords)
      correction_codeword_length = 2 ** (config.security_level + 1)
      sum_codewords = 1 + codewords.length + correction_codeword_length
      rows = (sum_codewords / config.columns.to_f).ceil
      pad_count = rows * config.columns - sum_codewords
      codewords.concat(Array.new(pad_count, PAD_CODEWORD))
    end

    def length_descriptor(codewords)
      codewords.unshift(1 + codewords.length)
    end

    def error_correction(codewords)
      codewords.concat(
        ErrorCorrection.correction_codewords(
          codewords, config.security_level
        )
      )
    end
  end
end
