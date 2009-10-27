require 'spec_helper'

describe Item do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :type => "value for type",
      :status => "value for status",
      :checkout_date => Date.today,
      :due_date => Date.today,
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Item.create!(@valid_attributes)
  end
end
