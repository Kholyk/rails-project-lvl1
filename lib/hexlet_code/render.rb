# frozen_string_literal: true

module HexletCode
  class Render
    def self.html(form_instance)
      form_attributes = form_instance.form_options.except(:with_labels)

      children = form_instance.fields.reduce [] do |acc, hash|
        field_class = "HexletCode::#{hash[:type].capitalize}".constantize
        acc << field_class.render_from(hash)
      end.join

      Tag.build('form', { ** form_attributes }) { children }
    end
  end
end
