# frozen_string_literal: true

module HexletCode
  class SubmitField
    def initialize(value, options)
      @value = value
      @options = options
    end
    def render
      attributes = { type: 'submit', value: @value }
      Tag.build('input', attributes.merge(@options))
    end
  end
end