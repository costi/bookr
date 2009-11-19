require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cpl_library_cards/edit.html.erb" do
  include CplLibraryCardsHelper
  
  before(:each) do
    assigns[:cpl_library_card] = @cpl_library_card = stub_model(CplLibraryCard,
      :new_record? => false,
      :user_id => 1,
      :number => "value for number",
      :zip_code => "value for zip_code"
    )
  end

  it "renders the edit cpl_library_card form" do
    render
    
    response.should have_tag("form[action=#{cpl_library_card_path(@cpl_library_card)}][method=post]") do
      with_tag('input#cpl_library_card_user_id[name=?]', "cpl_library_card[user_id]")
      with_tag('input#cpl_library_card_number[name=?]', "cpl_library_card[number]")
      with_tag('input#cpl_library_card_zip_code[name=?]', "cpl_library_card[zip_code]")
    end
  end
end


