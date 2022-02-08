# frozen_string_literal: true

require "test_helper"
require_relative "../lib/hexlet_code/tag/single_tag"
require_relative "../lib/hexlet_code/tag/paired_tag"
require_relative "../lib/hexlet_code/tag/tag"

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_single_tag_builder
    assert SingleTag.build("img", src: "path/to/image") == '<img src="path/to/image">'
    assert SingleTag.build("img", src: "path/to/image", alt: "image") == '<img src="path/to/image" alt="image">'
    assert SingleTag.build("br") == "<br>"
  end

  def test_paired_tag_builder
    assert PairedTag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>'
    assert PairedTag.build('div') == '<div></div>'
  end

  def test_nested_tags
    nested = PairedTag.build('label', for: 'email') { PairedTag.build('div') {SingleTag.build("br")} }
    assert nested == '<label for="email"><div><br></div></label>'
  end

  def test_tag_common
    assert Tag.build('br') == "<br>"
    assert Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>'
  end

  def test_nested_common_tags
    nested = Tag.build('label', for: 'email') { Tag.build('div') {Tag.build("br")} }
    assert nested == '<label for="email"><div><br></div></label>'
  end
end
