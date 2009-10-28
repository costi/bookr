require 'spec_helper'

describe "/pages/index.html.erb" do
  include PagesHelper

  before(:each) do
    assigns[:pages] = [
      stub_model(Page,
        :user_id => 1,
        :log => "value for log",
        :status => false,
        :document => "value for document"
      ),
      stub_model(Page,
        :user_id => 1,
        :log => "value for log",
        :status => false,
        :document => "value for document"
      )
    ]
  end

  it "renders a list of pages" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for log".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
    response.should have_tag("tr>td", "value for document".to_s, 2)
  end
end
