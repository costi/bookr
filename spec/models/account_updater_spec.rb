require File.dirname(__FILE__) + '/../spec_helper'

def set_up_crawler

end  

describe AccountUpdater do
  

  it "should accept a User as the first argument for instantation" do
      lambda {AccountUpdater.new(Array.new(), CplCrawler.new(:number => "", :zip_code => ""))}.should raise_error()
  end
  
  it "should accept a Crawler as the 2nd argument for instantation" do
      lambda {AccountUpdater.new(User.new(), Array.new())}.should raise_error()
  end
    
  it "method update should create all the items from a crawl/parse of the CPL website" do
    summary_fixture = File.read(File.join(fixture_path, 'cpl', 'cpl_checkedout_overdue_on_hold.html'))
    crawler = CplCrawler.new("D245236142","50692")
    crawler.stub!(:login_to_library).and_return(summary_fixture)
    crawler.stub!(:summary_page).and_return(summary_fixture)
    
    lambda do 
      u = AccountUpdater.new(User.first, crawler)
      u.run
    end.should change(Item, :count)
  end

  describe 'detecting transitions' do
    
    before do
      @user = User.first
      #FIXME - fix unicode for Cria Cuervos and change the file back to the unicode  one
      summary_fixture = File.read(File.join(fixture_path, 'cpl', 'cpl_checkedout_overdue_on_hold-NoUnicode.html'))
      @crawler = CplCrawler.new("D245236142","50692")
      @crawler.stub!(:login_to_library).and_return(summary_fixture)
      @crawler.stub!(:summary_page).and_return(summary_fixture)
    end
  
    it "should detect a move from holds to checked out" do
      item = @user.items.create!(:title => 'Sexo para dummies /', :status => 'Held')
      updater = AccountUpdater.new(@user, @crawler)
      updater.run
      item.reload.status.should == 'Checked out'
    end
  
    it "should detect a move from checked out to overdue" do
      item = @user.items.create!(:title => 'Cria cuervos', :status => 'Checked out')
      updater = AccountUpdater.new(@user, @crawler)
      updater.run
      item.reload.status.should == 'Overdue'
    end
  
    it "should detect a return" do
      pending
    end
  
    it "should detect a non picked up hold which was returned after 9 days" do
      # whatever is missing from holds and is not checked out is gone
      pending
    end
  
    it "should detect a move from overdue to returned" do
      pending
    end
  
    it "should detect a renewal for checked out items" do
      pending
    end
    
    it "should detect an apparition straigt to overdue (for new accounts)" do
      pending
    end
    
  end#'detecting transitions'
  
end