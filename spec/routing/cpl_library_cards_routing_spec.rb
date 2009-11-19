require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CplLibraryCardsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "cpl_library_cards", :action => "index").should == "/cpl_library_cards"
    end
  
    it "maps #new" do
      route_for(:controller => "cpl_library_cards", :action => "new").should == "/cpl_library_cards/new"
    end
  
    it "maps #show" do
      route_for(:controller => "cpl_library_cards", :action => "show", :id => "1").should == "/cpl_library_cards/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "cpl_library_cards", :action => "edit", :id => "1").should == "/cpl_library_cards/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "cpl_library_cards", :action => "create").should == {:path => "/cpl_library_cards", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "cpl_library_cards", :action => "update", :id => "1").should == {:path =>"/cpl_library_cards/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "cpl_library_cards", :action => "destroy", :id => "1").should == {:path =>"/cpl_library_cards/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/cpl_library_cards").should == {:controller => "cpl_library_cards", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/cpl_library_cards/new").should == {:controller => "cpl_library_cards", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/cpl_library_cards").should == {:controller => "cpl_library_cards", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/cpl_library_cards/1").should == {:controller => "cpl_library_cards", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/cpl_library_cards/1/edit").should == {:controller => "cpl_library_cards", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/cpl_library_cards/1").should == {:controller => "cpl_library_cards", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/cpl_library_cards/1").should == {:controller => "cpl_library_cards", :action => "destroy", :id => "1"}
    end
  end
end
