require 'spec_helper'

describe "/pages/show.html.erb" do
  include PagesHelper
  before(:each) do
    assigns[:page] = @page = stub_model(Page,
      :user_id => 1,
      :log => "value for log",
      :status => false,
      :document => "value for document"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ log/)
    response.should have_text(/false/)
    response.should have_text(/value\ for\ document/)
  end
end
