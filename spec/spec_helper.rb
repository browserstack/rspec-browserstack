require 'rspec'
require_relative './browserstack_driver.rb'
 
RSpec.configure do |config|
  config.around(:example, :run_on_browserstack => true) do |example|
    @driver = BrowserStackDriver.new_driver
    begin
      example.run
    ensure
      @driver.quit
    end
  end
end