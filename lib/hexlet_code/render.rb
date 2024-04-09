# frozen_string_literal: true

module HexletCode
  class Render
    def self.html(form_instance)
      form_attributes = form_instance.form_options.except(:with_labels)

      children = form_instance.fields.map do |field|
        field_class = "HexletCode::#{field[:type].capitalize}".constantize
        field_class.render_from(field)
      end.join

      Tag.build('form', { ** form_attributes }) { children }
    end
  end
end
