
[![CI](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/main.yml)
[![hexlet-check](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/hexlet-check.yml)


# HexletCode

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/hexlet_code`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage
Generate form using Structure builder

```Ruby
# Define structure for User model
NewUser = Struct.new(:name, :job, :gender, keyword_init: true)

# Create specific user according to structure
new_user = NewUser.new name: "rob", job: "hexlet", gender: "m"

# Gnerate form
tag_with_url = HexletCode.form_for new_user do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

```
As a result you'll be able to get a complete HTML form

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob">
  <label for="job">Job</label>
  <textarea cols="20" rows="40" name="job">hexlet</textarea>
  <input name="commit" type="submit" value="Save">
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code.
