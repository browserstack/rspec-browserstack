require 'rspec'
require_relative './browserstack_driver.rb'
require 'browserstack/local'

BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY']
run_local = false

RSpec.configure do |config|
  config.around(:example, :run_on_browserstack => true) do |example|
    @driver = BrowserStackDriver.new_driver
    if run_local
      @bs_local = BrowserStack::Local.new
      bs_local_args = { "key" => "#{BROWSERSTACK_ACCESS_KEY}", "forcelocal" => true }
      @bs_local.start(bs_local_args)
    end

    begin
      example.run
    ensure
      @driver.quit
      if run_local
        @bs_local.stop
      end
    end
  end
end
