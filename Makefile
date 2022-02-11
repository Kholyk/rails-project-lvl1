install:
	bundle install
test:
	bundle exec rake test
cleartest:
	clear && bundle exec rake test
lint:
	bundle exec rubocop
lint-fix:
	bundle exec rubocop -A
.PHONY: test