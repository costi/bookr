require 'spec_helper'

describe "/pages/edit.html.erb" do
  include PagesHelper

  before(:each) do
    assigns[:page] = @page = stub_model(Page,
      :new_record? => false,
      :user_id => 1,
      :log => "value for log",
      :status => false,
      :document => "value for document"
    )
  end

  it "renders the edit page form" do
    render

    response.should have_tag("form[action=#{page_path(@page)}][method=post]") do
      with_tag('input#page_user_id[name=?]', "page[user_id]")
      with_tag('input#page_log[name=?]', "page[log]")
      with_tag('input#page_status[name=?]', "page[status]")
      with_tag('textarea#page_document[name=?]', "page[document]")
    end
  end
end
