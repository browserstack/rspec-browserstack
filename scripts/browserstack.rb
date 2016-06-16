require 'yaml'
require 'rspec'
require 'selenium-webdriver'
require 'browserstack/local'

CONFIG = YAML.load(File.read(File.join(File.dirname(__FILE__),'../config.yml')))
CONFIG['user'] = ENV['BROWSERSTACK_USERNAME'] || CONFIG['user']
CONFIG['key'] = ENV['BROWSERSTACK_ACCESS_KEY'] || CONFIG['key']
TASK_ID = (ENV['TASK_ID'] || 0).to_i


RSpec.configure do |config|
  config.around(:example) do |example|
    enable_local = example.metadata[:enable_local]

    @caps = CONFIG['common_caps'].merge(CONFIG['browser_caps'][TASK_ID])
    @caps["name"] = ENV['name'] || example.metadata[:name] || example.metadata[:file_path].split('/').last.split('.').first

    if enable_local
      @bs_local = BrowserStack::Local.new
      bs_local_args = { "key" => CONFIG['key'], "forcelocal" => true }
      @bs_local.start(bs_local_args)
      @caps["browserstack.local"] = true
    end

    @driver = Selenium::WebDriver.for(:remote,
      :url => "http://#{CONFIG['user']}:#{CONFIG['key']}@#{CONFIG['server']}/wd/hub",
      :desired_capabilities => @caps)

    begin
      example.run
    ensure 
      @driver.quit
      @bs_local.stop if enable_local
    end
  end
end
