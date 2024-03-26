# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/form"



module HexletCode
  autoload :Tag, "hexlet_code/tag"
  autoload :Input, "hexlet_code/input"
  autoload :TextField, "hexlet_code/fields/text_field"
  autoload :TextareaField, "hexlet_code/fields/textarea_field"
  autoload :SubmitField, "hexlet_code/fields/submit_field"
  class Error < StandardError; end
end
