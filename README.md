# rspec-browserstack

Execute [Rspec](http://rspec.info/) scripts on BrowserStack.

## Usage

### Prerequisites

Ruby and Bundler

### Clone the repo

`git clone https://github.com/browserstack/rspec-browserstack`

### Install dependencies

Navigate to appropriate directory for testing and then install the dependencies by running

`bundle install`

### BrowserStack Authentication

Export the environment variables for the username and access key of your BrowserStack account.
These can be found on the automate accounts page on [BrowserStack](https://www.browserstack.com/accounts/automate)

`export BROWSERSTACK_USERNAME=<browserstack-username>`

`export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>`

### Run the tests

- To run tests on the BrowserStack Infrastructure, create file called browserstack_driver.rb.
- Create a file in the spec directory called spec_helper.rb. This sets up a new block of code to be run around every example tagged with :run_on_browserstack => true. 
- Check out the google_spec.rb file for an example test.
- Local Testing requires a locally serving html server.
- To run the tests, run the command `bundle exec rspec spec/`
- To run parallel tests, run the command `bundle exec parallel_rspec -n 2 spec/`
- You can increase n to increase the number of tests to run in parallel.
- To run local tests, set run_local = true in spec/spec_helper.rb file.  

#### How to specify the capabilities

The [Code Generator](https://www.browserstack.com/automate/ruby#setting-os-and-browser) can come in very handy when specifying the capabilities especially for mobile devices.
