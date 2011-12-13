require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CplLibraryCardsController do

  def mock_cpl_library_card(stubs={})
    @mock_cpl_library_card ||= mock_model(CplLibraryCard, stubs)
  end
  
  describe "GET index" do
    it "assigns all cpl_library_cards as @cpl_library_cards" do
      CplLibraryCard.stub!(:find).with(:all).and_return([mock_cpl_library_card])
      get :index
      assigns[:cpl_library_cards].should == [mock_cpl_library_card]
    end
  end

  describe "GET show" do
    it "assigns the requested cpl_library_card as @cpl_library_card" do
      CplLibraryCard.stub!(:find).with("37").and_return(mock_cpl_library_card)
      get :show, :id => "37"
      assigns[:cpl_library_card].should equal(mock_cpl_library_card)
    end
  end

  describe "GET new" do
    it "assigns a new cpl_library_card as @cpl_library_card" do
      CplLibraryCard.stub!(:new).and_return(mock_cpl_library_card)
      get :new
      assigns[:cpl_library_card].should equal(mock_cpl_library_card)
    end
  end

  describe "GET edit" do
    it "assigns the requested cpl_library_card as @cpl_library_card" do
      CplLibraryCard.stub!(:find).with("37").and_return(mock_cpl_library_card)
      get :edit, :id => "37"
      assigns[:cpl_library_card].should equal(mock_cpl_library_card)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created cpl_library_card as @cpl_library_card" do
        CplLibraryCard.stub!(:new).with({'these' => 'params'}).and_return(mock_cpl_library_card(:save => true))
        post :create, :cpl_library_card => {:these => 'params'}
        assigns[:cpl_library_card].should equal(mock_cpl_library_card)
      end

      it "redirects to the created cpl_library_card" do
        CplLibraryCard.stub!(:new).and_return(mock_cpl_library_card(:save => true))
        post :create, :cpl_library_card => {}
        response.should redirect_to(cpl_library_card_url(mock_cpl_library_card))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved cpl_library_card as @cpl_library_card" do
        CplLibraryCard.stub!(:new).with({'these' => 'params'}).and_return(mock_cpl_library_card(:save => false))
        post :create, :cpl_library_card => {:these => 'params'}
        assigns[:cpl_library_card].should equal(mock_cpl_library_card)
      end

      it "re-renders the 'new' template" do
        CplLibraryCard.stub!(:new).and_return(mock_cpl_library_card(:save => false))
        post :create, :cpl_library_card => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested cpl_library_card" do
        CplLibraryCard.should_receive(:find).with("37").and_return(mock_cpl_library_card)
        mock_cpl_library_card.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cpl_library_card => {:these => 'params'}
      end

      it "assigns the requested cpl_library_card as @cpl_library_card" do
        CplLibraryCard.stub!(:find).and_return(mock_cpl_library_card(:update_attributes => true))
        put :update, :id => "1"
        assigns[:cpl_library_card].should equal(mock_cpl_library_card)
      end

      it "redirects to the cpl_library_card" do
        CplLibraryCard.stub!(:find).and_return(mock_cpl_library_card(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(cpl_library_card_url(mock_cpl_library_card))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested cpl_library_card" do
        CplLibraryCard.should_receive(:find).with("37").and_return(mock_cpl_library_card)
        mock_cpl_library_card.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :cpl_library_card => {:these => 'params'}
      end

      it "assigns the cpl_library_card as @cpl_library_card" do
        CplLibraryCard.stub!(:find).and_return(mock_cpl_library_card(:update_attributes => false))
        put :update, :id => "1"
        assigns[:cpl_library_card].should equal(mock_cpl_library_card)
      end

      it "re-renders the 'edit' template" do
        CplLibraryCard.stub!(:find).and_return(mock_cpl_library_card(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested cpl_library_card" do
      CplLibraryCard.should_receive(:find).with("37").and_return(mock_cpl_library_card)
      mock_cpl_library_card.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the cpl_library_cards list" do
      CplLibraryCard.stub!(:find).and_return(mock_cpl_library_card(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(cpl_library_cards_url)
    end
  end

end
