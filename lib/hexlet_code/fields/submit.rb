# frozen_string_literal: true

module HexletCode
  class Submit < Input
    def initialize(field_value = 'Save', field_attributes = {})
      super
      @meta = {
        tag_name: 'input',
        value: field_value,
        attributes: { type: 'submit', value: field_value }.merge(field_attributes)
      }
    end
  end
end
