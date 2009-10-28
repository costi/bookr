require 'spec_helper'

describe Page do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :log => "value for log",
      :status => false,
      :document => "value for document"
    }
  end

  it "should create a new instance given valid attributes" do
    Page.create!(@valid_attributes)
  end
  
end
