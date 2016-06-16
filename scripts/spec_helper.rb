require 'rspec'
require 'selenium-webdriver'
require 'browserstack/local'

BROWSERSTACK_USERNAME = ENV['BROWSERSTACK_USERNAME']
BROWSERSTACK_ACCESS_KEY = ENV['BROWSERSTACK_ACCESS_KEY']
BROWSERSTACK_URL = "http://#{BROWSERSTACK_USERNAME}:#{BROWSERSTACK_ACCESS_KEY}@hub-cloud.browserstack.com/wd/hub"
CAPABILITIES = [{}]

RSpec.configure do |config|
  config.around(:example) do |example|
    enable_local = example.metadata[:enable_local]

    @caps = CAPABILITIES[0]
    @caps["build"] = "rspec-browserstack"
    @caps["name"] = example.metadata[:name] || example.metadata[:file_path].split('/').last.split('.').first

    if enable_local
      @bs_local = BrowserStack::Local.new
      bs_local_args = { "key" => "#{BROWSERSTACK_ACCESS_KEY}", "forcelocal" => true }
      @bs_local.start(bs_local_args)
      @caps["browserstack.local"] = true
    end

    @driver = Selenium::WebDriver.for :remote, :url => BROWSERSTACK_URL, :desired_capabilities => @caps
    begin
      example.run
    ensure 
      @driver.quit
      @bs_local.stop if enable_local
    end
  end
end
