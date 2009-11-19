require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CplLibraryCard do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :number => "D123456789",
      :zip_code => "60640"
    }
  end

  it "should create a new instance given valid attributes" do
    CplLibraryCard.create!(@valid_attributes)
  end
  
  it 'should not allow bad library card numbers' do
    lambda do
      card = CplLibraryCard.create(@valid_attributes.except(:number).merge(:number => 'BAD NUMBER'))
    end.should_not change(CplLibraryCard, :count)
  end

  it 'should not allow bad zip codes' do
    lambda do
      card = CplLibraryCard.create(@valid_attributes.except(:zip_code).merge(:zip_code => 'BAD NUMBER'))
    end.should_not change(CplLibraryCard, :count)
  end
  
  it "should belong to a valid user" do
    lambda do
      card = CplLibraryCard.create(@valid_attributes.except(:user_id).merge(:user_id => 1757457))
    end.should_not change(CplLibraryCard, :count)
  end
  
end
