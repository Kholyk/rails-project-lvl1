# frozen_string_literal: true

# input fields generators
class Inputs
  class Error < StandardError; end

  autoload(:Submit, 'hexlet_code/input_types/submit')
  autoload(:Input, 'hexlet_code/input_types/input')
  include Submit
  include Input

  attr_accessor :input_fields, :struct

  def initialize(structure)
    @input_fields = []
    @struct = structure
  end

  def body
    input_fields
  end
end
