rspec-browserstack
=========

This repository provides information and helpful tweaks to run your Rspec tests on the BrowserStack selenium cloud infrastructure.

###Configuration
- Add the RSpec and ParallelTests gems into your Gemfile.
- Run `bundle install`.

###Sample test
- To run tests on the BrowserStack Infrastructure, create file called browserstack_driver.rb.
- Create a file in the spec directory called spec_helper.rb. This sets up a new block of code to be run around every example tagged with :run_on_browserstack => true. 
- Check out the google_spec.rb file for an example test.


###Run tests
- To run your tests, run the command `bundle exec parallel_rspec -n 2 spec/`
- You can increase n to increase the number of tests to run in parallel.


###Further Reading
- [rspec](http://rspec.info/)
- [BrowserStack documentation for Automate](https://www.browserstack.com/automate/ruby)

Happy Testing!
