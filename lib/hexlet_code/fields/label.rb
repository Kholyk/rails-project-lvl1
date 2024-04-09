# frozen_string_literal: true

module HexletCode
  module Label
    def add_label_for(tag, field)
      return tag unless field[:with_labels]

      field_name = field[:name]
      label = Tag.build('label', { for: field_name }) { field_name.capitalize }

      "#{label}#{tag}"
    end
  end
end
