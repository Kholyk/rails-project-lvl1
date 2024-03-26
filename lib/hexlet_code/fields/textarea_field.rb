# frozen_string_literal: true

module HexletCode
  class TextareaField < Input
    def render
      area_attributes = { name: field_name, cols: 20, rows: 40 }.merge(options.except(:as))
      result ||= []
      result << Tag.build('label', { for: field_name }) { field_name.to_s.capitalize }
      result << Tag.build('textarea', area_attributes) { field_value }
    end
  end
end
