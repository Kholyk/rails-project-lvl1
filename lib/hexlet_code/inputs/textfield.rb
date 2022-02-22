# frozen_string_literal: true

# Creates text field
class Textfield
  autoload(:Tag, 'hexlet_code/tag/tag')
  def self.create(name, value = nil, options = {})
    field_attributes = { name: name, type: 'text', value: value, **options }
    Tag.public_send :build, 'input', field_attributes
  end
end
