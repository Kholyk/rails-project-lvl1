# frozen_string_literal: true

# Tag Prototype Class
module TagPrototype
  def attributes_to_string(attributes = {})
    return "" if attributes.empty?

    attr_string = attributes.collect { |key, value| "#{key}=\"#{value}\"" }.join ' '
    " #{attr_string}"
  end
end
