# frozen_string_literal: true

require 'set'
require_relative './tag_prototype'

# Generates html entity
module Tag
  extend TagPrototype

  def self.build(name, attributes = {}, &block)
    result = ["<#{name}#{attributes_to_string(attributes)}>"]
    result.push yield block if block_given?
    result.push "</#{name}>" if block_given?
    result.join ''
  end
end
