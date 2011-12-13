require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/cpl_library_cards/index.html.erb" do
  include CplLibraryCardsHelper
  
  before(:each) do
    assigns[:cpl_library_cards] = [
      stub_model(CplLibraryCard,
        :user_id => 1,
        :number => "value for number",
        :zip_code => "value for zip_code"
      ),
      stub_model(CplLibraryCard,
        :user_id => 1,
        :number => "value for number",
        :zip_code => "value for zip_code"
      )
    ]
  end

  it "renders a list of cpl_library_cards" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for number".to_s, 2)
    response.should have_tag("tr>td", "value for zip_code".to_s, 2)
  end
end

