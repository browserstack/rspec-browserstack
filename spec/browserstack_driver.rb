require 'selenium-webdriver'
 
module BrowserStackDriver
  USERNAME = ENV['BROWSERSTACK_USERNAME']
  BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY']
  class << self
    def browserstack_endpoint
      url = "http://#{USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub.browserstack.com/wd/hub"
    end
 
    def caps
      caps = {
        "browser": "firefox",
        "browser_version": "16.0",
        "os": "Windows",
        "os_version": "7"
      }
    end
 
    def new_driver
      Selenium::WebDriver.for :remote, :url => browserstack_endpoint, :desired_capabilities => caps
    end
  end
end
