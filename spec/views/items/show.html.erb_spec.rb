require 'spec_helper'

describe "/items/show.html.erb" do
  include ItemsHelper
  before(:each) do
    assigns[:item] = @item = stub_model(Item,
      :title => "value for title",
      :type => "value for type",
      :status => "value for status",
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ type/)
    response.should have_text(/value\ for\ status/)
    response.should have_text(/1/)
  end
end
