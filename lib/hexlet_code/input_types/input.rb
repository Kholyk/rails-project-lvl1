# frozen_string_literal: true

# input field (text/textarea) generator
module Input
  autoload(:Label, "hexlet_code/inputs/label")
  autoload(:Textarea, "hexlet_code/inputs/textarea")
  autoload(:Textfield, "hexlet_code/inputs/textfield")
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
end
