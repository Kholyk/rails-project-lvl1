# frozen_string_literal: true

require "test_helper"
# require_relative "../lib/hexlet_code/tag/single_tag"
# require_relative "../lib/hexlet_code/tag/paired_tag"
# require_relative "../lib/hexlet_code/tag/tag"

class HexletCodeTest < Minitest::Test
  # Создаем класс User с полями name и job
  User = Struct.new(:name, :job, keyword_init: true)

  NewUser = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  # def test_single_tag_builder
  #   assert SingleTag.build("img", src: "path/to/image") == '<img src="path/to/image">'
  #   assert SingleTag.build("img", src: "path/to/image", alt: "image") == '<img src="path/to/image" alt="image">'
  #   assert SingleTag.build("br") == "<br>"
  # end
  #
  # def test_paired_tag_builder
  #   assert PairedTag.build("label", for: "email") { "Email" } == '<label for="email">Email</label>'
  #   assert PairedTag.build("div") == "<div></div>"
  # end
  #
  # def test_nested_tags
  #   nested = PairedTag.build("label", for: "email") { PairedTag.build("div") { SingleTag.build("br") } }
  #   assert nested == '<label for="email"><div><br></div></label>'
  # end
  #
  # def test_tag_common
  #   assert Tag.build("br") == "<br>"
  #   assert Tag.build("label", for: "email") { "Email" } == '<label for="email">Email</label>'
  # end
  #
  # def test_nested_common_tags
  #   nested = Tag.build("label", for: "email") { Tag.build("div") { Tag.build("br") } }
  #   assert nested == '<label for="email"><div><br></div></label>'
  # end

  def test_create_form_tag
    # Создаем конкретно пользователя и заполняем имя
    user = User.new name: "rob"

    tag_with_url = HexletCode.form_for user, url: "/users" do |f|
    end

    assert tag_with_url == '<form action="/users" method="post"></form>'

    tag_without_url = HexletCode.form_for user do |f|
    end

    assert tag_without_url == '<form action="#" method="post"></form>'
  end

  def test_create_form_tag_with_input
    new_user = NewUser.new name: "rob", job: "hexlet", gender: "m"

    tag_with_url = HexletCode.form_for new_user do |f|
      f.input :name, blind: true
      f.input :job, as: :text, blind: true
    end

    assert tag_with_url == get_fixture_content("simple_form")
  end

  def test_create_form_with_submit
    new_user = NewUser.new name: "rob", job: "hexlet", gender: "m"

    tag_with_url = HexletCode.form_for new_user do |f|
      f.input :name, blind: true
      f.input :job, as: :text, blind: true
      f.submit
    end

    assert tag_with_url == get_fixture_content("submit_form")
  end

  def test_create_labeled_form_with_submit
    new_user = NewUser.new name: "rob", job: "hexlet", gender: "m"

    tag_with_url = HexletCode.form_for new_user do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end

    assert tag_with_url == get_fixture_content("submit_labeled_form")
  end

  def test_create_empty_form_with_submit
    new_user = NewUser.new name: "rob", job: "hexlet", gender: "m"

    tag_with_url = HexletCode.form_for new_user, &:submit

    assert tag_with_url == get_fixture_content("submit_empty_form")
  end
end
