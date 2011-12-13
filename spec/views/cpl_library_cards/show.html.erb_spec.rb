require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cpl_library_cards/show.html.erb" do
  include CplLibraryCardsHelper
  before(:each) do
    assigns[:cpl_library_card] = @cpl_library_card = stub_model(CplLibraryCard,
      :user_id => 1,
      :number => "value for number",
      :zip_code => "value for zip_code"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ number/)
    response.should have_text(/value\ for\ zip_code/)
  end
end

