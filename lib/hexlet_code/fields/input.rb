# frozen_string_literal: true

module HexletCode
  class Input
    extend Label
    def self.render_from(hash)
      hash[:type] = 'text'
      tag = Tag.build('input', hash.except(:with_labels))
      string_from tag, hash
    end
  end
end
