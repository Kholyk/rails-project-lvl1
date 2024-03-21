# frozen_string_literal: true

class Tag
  def self.build(name, attributes = {}, &block)
    tag = []
    tag << "<#{name}#{render_attributes(attributes)}>"
    return tag.join if tag_single?(name)

    tag << yield if block
    tag << "</#{name}>"
    tag.join
  end

  def self.tag_single?(tag_name)
    singles = %w[img br input hr]
    singles.include? tag_name
  end

  def self.render_attributes(attributes = {})
    attributes.collect { |key, value| " #{key}=\"#{value}\"" }.join
  end
end
