# frozen_string_literal: true

module HexletCode
  class Submit < Input
    def initialize(field_value = 'Submit', field_attributes = {})
      super
      @meta = {
        tag_name: 'input',
        attributes: { type: 'submit', value: field_value }.merge(field_attributes)
      }
    end
  end
end
