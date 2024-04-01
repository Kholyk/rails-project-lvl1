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
  end

  def self.form_for(model, form_options = {})
    @form = Form.new model, form_options
    @form.fields = yield(self) if block_given?
    Render.new(@form).to_html
  end

  def self.input(field_name, options = {})
    begin
      value = @form.model.public_send field_name
    rescue NoMethodError
      raise NoMethodError, "undefined method `#{field_name}` for #{@model}"
    end

    field_type_class = options.include?(:as) ? options[:as] : 'Input'
    @form.fields << "HexletCode::#{field_type_class.capitalize}".constantize.new(field_name, value, options).meta
  end

  def self.submit(value = 'Save', options = {})
    @form.fields << Submit.new(value, options).meta
  end
end
