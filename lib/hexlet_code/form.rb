# frozen_string_literal: true

require 'active_support'
require 'active_support/core_ext'

module HexletCode
  class Form
    attr_reader :model, :form_options
    attr_accessor :fields

    def initialize(model, options = {})
      @model = model
      @form_options = options
      @fields = []
    end

    def input(field_name, options = {})
      begin
        field_value = model.public_send field_name
      rescue NoMethodError
        raise NoMethodError, "undefined method `#{field_name}` for #{model}"
      end

      field_type = options.include?(:as) ? options[:as] : 'input'
      labeled = form_options[:with_labels]
      fields << { name: field_name, type: field_type, value: field_value, with_labels: labeled, **options }
    end

    def submit(caption = 'Save', options = {})
      fields << { type: 'submit', value: caption, ** options }
    end
  end
end
