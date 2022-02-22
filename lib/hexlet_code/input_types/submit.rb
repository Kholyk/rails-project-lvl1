# frozen_string_literal: true

# Submit input type
module Submit
  autoload(:Tag, "hexlet_code/tag/tag")

  def create(name)
    Tag.public_send :build, "input", name: "commit", type: "submit", value: name
  end

  def submit(name = "Save")
    input_fields.push create(name)
  end
end
