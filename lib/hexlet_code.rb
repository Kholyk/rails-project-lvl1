# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form"

module HexletCode
  class Error < StandardError; end
  autoload :Tag, "hexlet_code/tag"
end
