# frozen_string_literal: true

module HexletCode
  autoload :Tag, "tag"

  def self.form_for(struct, options = {}, &block)
    merge_attributes options
    Tag.build 'form', { ** attributes }
  end

  def self.attributes
    @attributes ||= { action: '#', method: 'post' }
  end

  def self.merge_attributes(options = {})
    action = options.fetch(:url, '#')
    options.reject! { |key| key.equal? :url }
    options[:action] = action
    @attributes = attributes.merge options
  end
end
