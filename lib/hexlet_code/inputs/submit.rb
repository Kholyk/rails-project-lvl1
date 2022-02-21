# frozen_tring_literal: true


class Submit
  autoload(:Tag, "hexlet_code/tag/tag")

  def self.create(name)
    Tag.public_send :build, "input", name: "commit", type: "submit", value: name
  end
end
