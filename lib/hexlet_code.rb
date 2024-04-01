# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'hexlet_code/form'
require_relative 'hexlet_code/render'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Field, 'hexlet_code/field'
  autoload :Input, 'hexlet_code/fields/input'
  autoload :Text, 'hexlet_code/fields/text'
  autoload :Submit, 'hexlet_code/fields/submit'
end
