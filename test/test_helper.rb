# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'

def get_fixture_content(fixture)
  file = File.new("test/fixtures/#{fixture}.html")
  File.open(file).read
end
