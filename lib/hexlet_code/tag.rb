# frozen_string_literal: true

module HexletCode
  module Tag
    def self.build(name, attributes = {})
      tag_head = "<#{name}#{render_attributes(attributes)}>"
      return tag_head if tag_single?(name)

      "#{tag_head}#{yield if block_given?}</#{name}>"
    end

    def self.tag_single?(tag_name)
      singles = %w[img br input hr]
      singles.include? tag_name
    end

    def self.render_attributes(attributes = {})
      attributes.collect { |key, value| " #{key}=\"#{value}\"" }.join
    end
  end
end
