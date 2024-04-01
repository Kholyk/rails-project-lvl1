# frozen_string_literal: true

module HexletCode
  class Input < Field
    def initialize(field_name, field_value, field_attributes = {})
      super
      meta[:attributes] = { name: field_name, type: 'text', value: field_value }.merge(field_attributes)
    end
  end
end
