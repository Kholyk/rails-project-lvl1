# frozen_string_literal: true

require_relative "hexlet_code/version"

# Form builder
module HexletCode
  autoload(:Inputs, "hexlet_code/inputs")
  autoload(:Tag, "hexlet_code/tag/tag")

  class Error < StandardError; end

  def self.form_for(structure, attr = {})
    input_fields = Inputs.new(structure)

    yield input_fields if block_given?

    Tag.build("form", action: attr[:url] ||= "#", method: "post") { input_fields.body }
  end
end
