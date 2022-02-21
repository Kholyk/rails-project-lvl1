# frozen_string_literal: true

# input fields generators
class Inputs
  autoload(:Label, "hexlet_code/inputs/label")
  autoload(:Textarea, "hexlet_code/inputs/textarea")
  autoload(:Textfield, "hexlet_code/inputs/textfield")
  autoload(:Submit, "hexlet_code/inputs/submit")

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

    field_value = struct[field_name]
    label_free = options[:blind]
    input_fields.push Label.public_send :create, field_name unless label_free
    if options[:as] == :text
      input_fields.push Textarea.public_send :create, field_name, field_value
    else
      input_fields.push Textfield.public_send :create, field_name, field_value
    end
  end

  def submit(name = "Save")
    input_fields.push Submit.public_send :create, name
  end
end
