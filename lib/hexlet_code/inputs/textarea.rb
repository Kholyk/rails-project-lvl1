# frozen_string_literal: true

# Textarea generator
class Textarea
  autoload(:Tag, 'hexlet_code/tag/tag')
  def self.create(name, value = nil, attributes = {})
    default_attributes = { cols: '20', rows: '40', name: name }
    given_attributes = attributes.reject { |key| key == :as }
    field_attributes = default_attributes.merge given_attributes

    block = proc { value }
    Tag.public_send :build, 'textarea', field_attributes, &block
  end
end
