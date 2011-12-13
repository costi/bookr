class CplLibraryCardsController < ApplicationController
  # GET /cpl_library_cards
  # GET /cpl_library_cards.xml
  def index
    @cpl_library_cards = CplLibraryCard.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cpl_library_cards }
    end
  end

  # GET /cpl_library_cards/1
  # GET /cpl_library_cards/1.xml
  def show
    @cpl_library_card = CplLibraryCard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cpl_library_card }
    end
  end

  # GET /cpl_library_cards/new
  # GET /cpl_library_cards/new.xml
  def new
    @cpl_library_card = CplLibraryCard.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cpl_library_card }
    end
  end

  # GET /cpl_library_cards/1/edit
  def edit
    @cpl_library_card = CplLibraryCard.find(params[:id])
  end

  # POST /cpl_library_cards
  # POST /cpl_library_cards.xml
  def create
    @cpl_library_card = CplLibraryCard.new(params[:cpl_library_card])

    respond_to do |format|
      if @cpl_library_card.save
        flash[:notice] = 'CplLibraryCard was successfully created.'
        format.html { redirect_to(@cpl_library_card) }
        format.xml  { render :xml => @cpl_library_card, :status => :created, :location => @cpl_library_card }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cpl_library_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cpl_library_cards/1
  # PUT /cpl_library_cards/1.xml
  def update
    @cpl_library_card = CplLibraryCard.find(params[:id])

    respond_to do |format|
      if @cpl_library_card.update_attributes(params[:cpl_library_card])
        flash[:notice] = 'CplLibraryCard was successfully updated.'
        format.html { redirect_to(@cpl_library_card) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cpl_library_card.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cpl_library_cards/1
  # DELETE /cpl_library_cards/1.xml
  def destroy
    @cpl_library_card = CplLibraryCard.find(params[:id])
    @cpl_library_card.destroy

    respond_to do |format|
      format.html { redirect_to(cpl_library_cards_url) }
      format.xml  { head :ok }
    end
  end
end
