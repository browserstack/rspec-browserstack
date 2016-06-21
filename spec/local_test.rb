require_relative '../scripts/browserstack.rb'

describe "BrowserStack Local Testing" do
  it "can check tunnel working" do
    @driver.navigate.to "http://bs-local.com:45691/check"
    @driver.title
    expect(@driver.page_source).to match(/Up and running/)
  end
end
