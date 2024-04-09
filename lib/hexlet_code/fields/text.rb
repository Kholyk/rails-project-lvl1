# frozen_string_literal: true

module HexletCode
  class Text
    extend Label

    def self.render_from(field)
      textarea_value = field[:value]
      textarea_field = { cols: 20, rows: 40 }.merge(field.except(:as, :type, :value, :with_labels))
      tag = Tag.build('textarea', textarea_field) { textarea_value }
      add_label_for tag, field
    end
  end
end
