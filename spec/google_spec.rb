require_relative './spec_helper.rb'
require 'selenium-webdriver'

describe "Google's Search Functionality" do
  it "can find search results", :run_on_browserstack => true do
    @driver.manage.timeouts.implicit_wait = 10
    @driver.navigate.to "http://www.google.com"
 
    raise "Unable to load Google." unless @driver.title.include? "Google"
 
    query = @driver.find_element :name, "q"
    query.send_keys "BrowserStack"
    query.submit
 
    puts @driver.title
  end
end