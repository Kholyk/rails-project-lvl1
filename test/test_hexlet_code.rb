# frozen_string_literal: true

require 'test_helper'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  def setup
    @user_model = Struct.new(:name, :job, :gender, keyword_init: true)
    @user_model = @user_model.new name: 'rob', job: 'hexlet', gender: 'm'
    @user_model1 = Struct.new(:name, :job, :description, keyword_init: true)
    @user_model1 = @user_model1.new job: 'hexlet'
    @form0 = load_fixture 'form_0.html'
    @form1 = load_fixture 'form_1.html'
    @form2 = load_fixture 'form_2.html'
    @form3 = load_fixture 'form_3.html'
    @labeled0 = load_fixture 'form_labeled_0.html'
    @labeled1 = load_fixture 'form_labeled_1.html'
    @labeled2 = load_fixture 'form_labeled_2.html'
  end

  # def test_that_it_has_a_version_number
  #   refute_nil ::HexletCode::VERSION
  # end
  #
  def test_tags_render_properly
    assert_equal '<br>', HexletCode::Tag.build('br')
    assert_equal '<img src="path/to/image">', HexletCode::Tag.build('img', src: 'path/to/image')
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build('input', type: 'submit', value: 'Save')
    assert_equal '<label>Email</label>', HexletCode::Tag.build('label') { 'Email' }
    assert_equal '<label for="email">Email</label>', HexletCode::Tag.build('label', for: 'email') { 'Email' }
    assert_equal '<div></div>', HexletCode::Tag.build('div')
  end
  #
  # def test_struct_works_properly
  #   assert_equal @user_model.name, 'rob'
  # end

  def test_root_form_tag_generates_properly
    form1 = HexletCode.form_for @user_model
    assert_equal '<form action="#" method="post"></form>', form1

    form2 = HexletCode.form_for @user_model, url: '/users'
    assert_equal '<form action="/users" method="post"></form>', form2

    form3 = HexletCode.form_for @user_model, url: '/users', class: 'form-control'
    assert_equal '<form action="/users" method="post" class="form-control"></form>', form3
  end
  #
  # def test_forms_render_without_labels
  #   form_0 = HexletCode.form_for @user_model do |f|
  #     # Проверяет есть ли значение внутри name
  #     f.input :name
  #     # Проверяет есть ли значение внутри job
  #     f.input :job, as: :text
  #   end
  #   assert_equal @form0, form_0
  #
  #   form_1 = HexletCode.form_for @user_model, url: '#' do |f|
  #     f.input :name, class: 'user-input'
  #     f.input :job
  #   end
  #   assert_equal @form1, form_1
  #
  #   form_2 = HexletCode.form_for @user_model do |f|
  #     f.input :job, as: :text
  #   end
  #   assert_equal @form2, form_2
  #
  #   form_3 = HexletCode.form_for @user_model, url: '#' do |f|
  #       f.input :job, as: :text, rows: 50, cols: 50
  #   end
  #   assert_equal @form3, form_3
  # end

  def test_labeled_forms
    labeled0 = HexletCode.form_for @user_model1 do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal @labeled0, labeled0

    labeled1 = HexletCode.form_for @user_model1, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal @labeled1, labeled1
  end

  def test_labeled_form_with_extra_attributes
    labeled2 = HexletCode.form_for @user_model1, url: 'user/update', method: 'patch' do |f|
      f.input :name
      f.input :job
      f.input :description, as: :text, class: 'form-control'
      f.submit 'Wow'
    end
    assert_equal @labeled2, labeled2
  end

  def test_raises_error_on_wrong_fields
    assert_raises HexletCode.form_for @user_model, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      # Поля age у пользователя нет
      f.input :age
    end
  end
end
