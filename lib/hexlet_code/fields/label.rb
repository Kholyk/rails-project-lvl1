# frozen_string_literal: true

module HexletCode
  module Label
    def prepend_label_for(hash)
      field_name = hash[:name]
      label = Tag.build('label', for: field_name) { field_name.capitalize }
      block_given? ? "#{label}#{yield}" : label
    end

    def string_from(tag, hash)
      with_labels = hash[:with_labels]
      with_labels ? prepend_label_for(hash) { tag } : tag
    end
  end
end
