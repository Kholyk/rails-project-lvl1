# frozen_string_literal: true

require_relative "./tag_prototype"

# Paired tag builder
class PairedTag
  extend TagPrototype

  def self.build(name, attributes = {}, &block)
    result = ["<#{name}#{attributes_to_string(attributes)}>"]

    result.push yield block if block_given?

    result.push "</#{name}>"

    result.join ""
  end
end
