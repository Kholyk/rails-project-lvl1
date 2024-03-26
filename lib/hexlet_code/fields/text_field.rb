# frozen_string_literal: true

module HexletCode
  class TextField < Input
    def render
      attributes = { name: name, type: 'text', value: value }
      result ||= []
      result << Tag.build('label', {for: name}) { name.to_s.capitalize }
      result << Tag.build('input', attributes.merge(options))
    end
  end
end