# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag/tag"
require_relative "hexlet_code/inputs"

# Form builder
module HexletCode
  class Error < StandardError; end

  def self.form_for(structure, attr = {})
    input_fileds = Inputs.new(structure)

    yield input_fileds if block_given?

    Tag.build("form", action: attr[:url] ||= "#", method: "post") { input_fileds.body }
  end
end
