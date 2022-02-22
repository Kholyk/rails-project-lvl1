# frozen_string_literal: true

# Textarea generator
class Textarea
  autoload(:Tag, "hexlet_code/tag/tag")
  def self.create(name, value = nil, attributes = { cols: "20", rows: "40" })
    attributes[:name] = name
    block = proc { value }
    Tag.public_send :build, "textarea", attributes, &block
  end
end
