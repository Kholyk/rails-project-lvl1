# frozen_string_literal: true

module HexletCode
  class Input
    extend Label
    def self.render_from(field)
      field[:type] = 'text'
      tag = Tag.build('input', field.except(:with_labels))
      add_label_for tag, field
    end
  end
end
