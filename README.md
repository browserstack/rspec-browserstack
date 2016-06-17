# rspec-browserstack

[Rspec](http://rspec.info/) Integration with BrowserStack.

## Setup

Clone the repo
Install dependencies `bundle install`
Update `congif.yml` with your BrowserStack credentials `user` and `key`

### Run the tests

- To run tests on the BrowserStack Infrastructure, create file called browserstack_driver.rb.
- Create a file in the spec directory called spec_helper.rb. This sets up a new block of code to be run around every example tagged with :run_on_browserstack => true. 
- Check out the google_spec.rb file for an example test.
- Local Testing requires a locally serving html server.
- To run the tests, run the command `bundle exec rspec spec/`
- To run parallel tests, run the command `bundle exec parallel_rspec -n 2 spec/`
- You can increase n to increase the number of tests to run in parallel.
- To run local tests, set run_local = true in spec/spec_helper.rb file.  

