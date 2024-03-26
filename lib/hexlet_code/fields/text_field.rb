# frozen_string_literal: true

module HexletCode
  class TextField < Input
    def render
      attributes = { name: field_name, type: 'text', value: field_value }
      result ||= []
      result << Tag.build('label', { for: field_name }) { field_name.to_s.capitalize }
      result << Tag.build('input', attributes.merge(options))
    end
  end
end
