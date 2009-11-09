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

  describe "should allow legitimate statuses" do
    %w(held checked_out overdue returned).each do |status|
      it ": #{status}" do 
        lambda do
          item = Item.create(:status => status)
          item.errors.on(:status).should be_nil
        end.should_not change(Item, :count)
      end
      
    end
  end
  
  it 'should have only valid statuses' do
    lambda do
      item = Item.create(:status => 'NonXstent')
      item.errors.on(:status).should_not be_nil
    end.should_not change(Item, :count)        
  end
  
  
  #
  # Validations
  #
  
  it 'requires user_id' do
    lambda do
      item = Item.create(:user_id => nil)
      item.errors.on(:user_id).should_not be_nil
    end.should_not change(Item, :count)    
  end
  
  
  it 'requires title' do
    lambda do
      item = Item.create(:title => nil)
      item.errors.on(:title).should_not be_nil
    end.should_not change(Item, :count)    
  end
end
