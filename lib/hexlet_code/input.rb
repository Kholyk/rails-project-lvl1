# frozen_string_literal: true

module HexletCode
  class Input
    attr_accessor :name, :value, :options

    def initialize(name, value, options = {})
      @name = name
      @value = value
      @options = options
    end
  end
end
