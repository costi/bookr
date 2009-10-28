require 'spec_helper'

describe CplCrawler do
  
  it "should be able to login into the CPL website" do
    c = CplCrawler.new('d054635158', '60626')
    c.login_to_library.content.should include('My Library Card', 'My Personal Information', 'My Preferred Library')
  end
  
end