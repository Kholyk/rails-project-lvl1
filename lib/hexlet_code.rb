# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag'
  autoload :Label, 'hexlet_code/fields/label'
  autoload :Input, 'hexlet_code/fields/input'
  autoload :Text, 'hexlet_code/fields/text'
  autoload :Submit, 'hexlet_code/fields/submit'
  autoload :Form, 'hexlet_code/form'
  autoload :Render, 'hexlet_code/render'

  def self.form_for(model, form_options = {})
    form_attributes = {
      action: form_options.fetch(:url, '#'),
      method: form_options.fetch(:method, 'post'),
      with_labels: form_options.fetch(:with_labels, true)
    }

    form = Form.new model, form_attributes.merge(form_options.except(:url))
    form.fields = yield form if block_given?

    Render.html form
  end
end
