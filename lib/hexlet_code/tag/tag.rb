# frozen_string_literal: true

require_relative "./single_tag"
require_relative "./paired_tag"
require "set"

# Generates html entity
module Tag
  def self.build(name, attributes = {}, &block)
    single_tags = %w[img br hr input].to_set

    return SingleTag.build(name, attributes) if single_tags.include? name

    PairedTag.build(name, attributes, &block)
  end
end
