# frozen_string_literal: true

require 'set'
require_relative './tag_prototype'

# Generates html entity
module Tag
  extend TagPrototype

  def self.build(name, attributes = {}, &block)
    result = ["<#{name}#{attributes_to_string(attributes)}>"]
    result.push yield block if block
    result.push "</#{name}>" if block
    result.join
  end
end
