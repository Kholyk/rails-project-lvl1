# frozen_string_literal: true

# Creates text field
class Textfield
  autoload(:Tag, "hexlet_code/tag/tag")

  def self.create(name, value = nil)
    Tag.public_send :build, "input", name: name, type: "text", value: value
  end
end
