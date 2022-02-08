# frozen_string_literal: true

require_relative "./tag_prototype"

# Single tag builder
class SingleTag
  extend TagPrototype

  def self.build(name, attributes = {})
    "<#{name}#{attributes_to_string(attributes)}>"
  end
end
