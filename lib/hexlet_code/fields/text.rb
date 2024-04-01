# frozen_string_literal: true

module HexletCode
  class Text < Field
    def initialize(field_name, field_value, field_attributes = {})
      super
      meta[:tag_name] = 'textarea'
      meta[:attributes] = { name: field_name, cols: 20, rows: 40 }.merge(field_attributes.except(:as))
    end
  end
end
