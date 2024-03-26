# frozen_string_literal: true

module HexletCode
  class Input
    attr_accessor :field_name, :field_value, :options

    def initialize(field_name, field_value, options = {})
      @field_name = field_name
      @field_value = field_value
      @options = options
    end
  end
end
