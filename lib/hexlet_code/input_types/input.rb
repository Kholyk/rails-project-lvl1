# frozen_string_literal: true

# input field (text/textarea) generator
module Input
  autoload(:Label, 'hexlet_code/inputs/label')
  autoload(:Textarea, 'hexlet_code/inputs/textarea')
  autoload(:Textfield, 'hexlet_code/inputs/textfield')
  def input(field_name, options = {})
    check field_name

    field_value = struct[field_name]

    input_fields.push Label.public_send :create, field_name

    if options[:as] == :text
      input_fields.push Textarea.public_send :create, field_name, field_value, options
    else
      input_fields.push Textfield.public_send :create, field_name, field_value, options
    end
  end

  private

  def check(name)
    raise NoMethodError, "'input': undefined method '#{name}' for #{struct}" unless struct.to_h.key? name
  end
end
