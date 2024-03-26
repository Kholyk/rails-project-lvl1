# frozen_string_literal: true
require 'active_support'
require "active_support/core_ext"

module HexletCode
  def self.model
    @model
  end

  def self.fields
    @fields
  end

  def self.form_options
    @form_options
  end

  attr_accessor :model, :fields, :form_options

  def self.form_for(model, form_options = {}, &block)
    @model = model
    @form_options = form_options
    @fields = []
    yield self if block
    render
  end

  def self.input(field_name, options = {})
    begin
      value = @model.public_send field_name
    rescue
      raise NoMethodError, "undefined method `#{field_name}` for #{@model}"
    end

    field_type_class = (options.include?(:as)) ? 'Textarea' : 'Text'
    fields << "HexletCode::#{field_type_class}Field".constantize.new(field_name, value, options)
  end

  def self.submit(value = 'Save', options = {})
    fields << SubmitField.new(value, options)
  end

  def self.render
    method = form_options.fetch(:method, 'post')
    action = form_options.fetch(:url, '#')
    attributes = { action: action, method: method }.merge(form_options.except(:url))

    children = fields.reduce [] do |acc, field|
      acc << field.render
    end.join

    Tag.build('form', { ** attributes }) { children }
  end
end
