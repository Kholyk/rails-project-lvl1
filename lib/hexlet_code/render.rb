# frozen_string_literal: true

module HexletCode
  class Render
    def initialize(form_instance)
      form_options = form_instance.form_options
      form_method = form_options.fetch(:method, 'post')
      on_submit = form_options.fetch(:url, '#')

      @form_attributes = { action: on_submit, method: form_method }.merge(form_options.except(:url))
      @fields = form_instance.fields
    end

    def to_html
      children = @fields.reduce [] do |acc, field|
        tag_name, name, value, attributes = field.values_at(:tag_name, :name, :value, :attributes)

        attributes.value?('submit') ||
          (acc << Tag.build('label', { for: name }) { name.to_s.capitalize })

        acc << Tag.build(tag_name, attributes) { value }
      end.join

      Tag.build('form', { ** @form_attributes }) { children }
    end
  end
end
