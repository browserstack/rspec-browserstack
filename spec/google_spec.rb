require_relative './spec_helper.rb'
require 'selenium-webdriver'

describe "Google's Search Functionality" do
  it "can find search results", :run_on_browserstack => true do
    @driver.navigate.to "https://www.google.com/ncr"
    element = @driver.find_element(:name, 'q')
    element.send_keys "BrowserStack"
    element.submit
    sleep 2
    expect(@driver.title).to eql("BrowserStack - Google Search")
  end
end
