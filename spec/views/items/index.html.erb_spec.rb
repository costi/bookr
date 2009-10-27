require 'spec_helper'

describe "/items/index.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:items] = [
      stub_model(Item,
        :title => "value for title",
        :type => "value for type",
        :status => "value for status",
        :user_id => 1
      ),
      stub_model(Item,
        :title => "value for title",
        :type => "value for type",
        :status => "value for status",
        :user_id => 1
      )
    ]
  end

  it "renders a list of items" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for type".to_s, 2)
    response.should have_tag("tr>td", "value for status".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
