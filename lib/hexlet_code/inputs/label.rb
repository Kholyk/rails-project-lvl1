# frozen_string_literal: true

# Label generator
class Label
  autoload(:Tag, 'hexlet_code/tag/tag')
  def self.create(name)
    block = proc { name.capitalize }
    Tag.public_send :build, 'label', for: name, &block
  end
end
