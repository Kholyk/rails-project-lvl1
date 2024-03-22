# frozen_string_literal: true

require "test_helper"
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  def setup
    @User = Struct.new :name, :job, keyword_init: true
    @user = @User.new name: 'rob'
  end
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_tags_render_properly
    assert_equal HexletCode::Tag.build('br'), '<br>'
    assert_equal HexletCode::Tag.build('img', src: 'path/to/image'), '<img src="path/to/image">'
    assert_equal HexletCode::Tag.build('input', type: 'submit', value: 'Save'), '<input type="submit" value="Save">'
    assert_equal HexletCode::Tag.build('label') { 'Email' }, '<label>Email</label>'
    assert_equal HexletCode::Tag.build('label', for: 'email') { 'Email' }, '<label for="email">Email</label>'
    assert_equal HexletCode::Tag.build('div'), '<div></div>'
  end

  def test_struct_works_properly
    assert_equal @user.name, 'rob'
  end

  def test_root_form_tag_generates_properly
    form1 = HexletCode.form_for @user do |f| end
    assert_equal form1, '<form action="#" method="post"></form>'

    form2 = HexletCode.form_for @user, url: '/users' do |f| end
    assert_equal form2, '<form action="/users" method="post"></form>'

    form3 = HexletCode.form_for @user, url: '/users', class: 'form-control' do |f| end
    assert_equal form3, '<form action="/users" method="post" class="form-control"></form>'
  end
end
