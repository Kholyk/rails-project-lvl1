# frozen_string_literal: true

module HexletCode
  class Text
    extend Label

    def self.render_from(hash)
      textarea_value = hash[:value]
      textarea_hash = { cols: 20, rows: 40 }.merge(hash.except(:as, :type, :value, :with_labels))
      tag = Tag.build('textarea', textarea_hash) { textarea_value }
      string_from tag, hash
    end
  end
end
