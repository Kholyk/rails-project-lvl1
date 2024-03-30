[![hexlet-check](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/hexlet-check.yml)
[![own-check](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/own-check.yml/badge.svg)](https://github.com/Kholyk/rails-project-lvl1/actions/workflows/own-check.yml)
# HexletCode

Form generator gem, it uses similar syntax as 'simple-form' gem

## Installation

TODO: Replace `hexlet-code` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet-code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet-code

## Usage

HTML Form generation:
```ruby
require 'hexlet-code'

# Add model prototype using Struct:
User = Struct.new(:name, :job, :description, keyword_init: true)

# Create user model using previously created prototype:
user = User.new(name: 'John', job: 'hexlet')

HexletCode.form_for user, url: '#' do |f|
  f.input :name
  f.input :job
  f.input :description, as: :text
  f.submit 'Proceed'
end
```
As a result module renders the following html form (see below)
```html
<form action="#" method="post">
    <label for="name">Name</label>
    <input name="name" type="text" value="John">
    <label for="job">Job</label>
    <input name="job" type="text" value="hexlet">
    <label for="description">Description</label>
    <textarea name="description" cols="20" rows="40"></textarea>
    <input type="submit" value="Proceed">
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Kholyk/rails-project-lvl1. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Kholyk/rails-project-lvl1/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Kholyk/rails-project-lvl1/blob/master/CODE_OF_CONDUCT.md).
