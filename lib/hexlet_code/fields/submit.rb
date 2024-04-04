# frozen_string_literal: true

module HexletCode
  class Submit
    def self.render_from(hash)
      hash[:value] ||= 'Save'
      Tag.build('input', hash)
    end
  end
end
