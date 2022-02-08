install:
	bundle install
@test:
	rake test
lint:
	bundle exec rubocop
lint-fix:
	bundle exec rubocop -A