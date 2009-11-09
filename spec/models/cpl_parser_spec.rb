require 'spec_helper'

describe CplParser do
  
  
   it "should parse fines" do
    p = CplParser.new(:all => File.read(File.join(fixture_path, "cpl", "cpl_just_fines.html")))
    p.total_fine_amount.to_s.should == "10.0"
  end
  
   it 'should parse held_items' do
     p = CplParser.new(:all => File.read(File.join(fixture_path, 'cpl', 'cpl_checkedout_overdue_on_hold.html')))
     p.held_items.size.to_s.should == "4.0"
   end
  
end