# frozen_string_literal: true

module HexletCode
  class Submit
    def self.render_from(field)
      Tag.build('input', field)
    end
  end
end
