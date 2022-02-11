# frozen_string_literal: true

require_relative "./tag/tag"

# input fields generators
class Inputs
  class Error < StandardError; end

  attr_accessor :input_fields, :struct

  def initialize(structure)
    @input_fields = []
    @struct = structure
  end

  def body
    input_fields
  end

  def input(field_name, options = {})
    raise "'input': undefined method '#{field_name}' for #{struct}" unless struct.to_h.key? field_name

    input_fields.push label(field_name) unless options[:blind]
    if options[:as] == :text
      input_fields.push textarea_field(field_name, struct[field_name])
    else
      input_fields.push text_field(field_name, struct[field_name])
    end
  end

  def submit(name = "Save")
    input_fields.push Tag.public_send :build, "input", name: "commit", type: "submit", value: name
  end

  private

  def textarea_field(name, value = nil, attributes = { cols: "20", rows: "40" })
    attributes[:name] = name
    block = proc { value }
    Tag.public_send :build, "textarea", attributes, &block
  end

  def text_field(name, value = nil)
    Tag.public_send :build, "input", name: name, type: "text", value: value
  end

  def label(name)
    block = proc { name.capitalize }
    Tag.public_send :build, "label", for: name, &block
  end
end
