require_relative '../scripts/spec_helper.rb'

describe "Google's Search Functionality" do
  it "can find search results", :enable_local => true do
    @driver.navigate.to "http://bs-local.com:45691/check"
    @driver.title
    expect(@driver.page_source).to match(/Up and running/)
  end
end
