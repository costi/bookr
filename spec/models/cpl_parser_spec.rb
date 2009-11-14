require 'spec_helper'

describe CplParser do
  
  
   it "should parse fines" do
    p = CplParser.new(:all => File.read(File.join(fixture_path, "cpl", "cpl_just_fines.html")))
    p.total_fine_amount.to_s.should == "10.0"
  end
  
   it 'should get the correct number of held_items' do
     p = CplParser.new(:all => File.read(File.join(fixture_path, 'cpl', 'cpl_checkedout_overdue_on_hold.html')))
     p.held_items.size == 4
   end
  
   it 'should parse a held item row' do
     p = CplParser.new(:all => File.read(File.join(fixture_path, 'cpl', 'cpl_checkedout_overdue_on_hold.html')))
     held_item = p.held_items.first
     held_item.title.should == 'Mon dernier soupir /'
     held_item.status.should == 'Ready for pickup'
   end
end