# frozen_string_literal: true

module HexletCode
  class Field
    attr_accessor :meta

    def initialize(field_name, field_value, field_attributes = {})
      @meta = {
        tag_name: 'input',
        name: field_name,
        value: field_value,
        attributes: field_attributes
      }
    end
  end
end
