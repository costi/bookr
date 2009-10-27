require 'spec_helper'

describe "/items/new.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:item] = stub_model(Item,
      :new_record? => true,
      :title => "value for title",
      :type => "value for type",
      :status => "value for status",
      :user_id => 1
    )
  end

  it "renders new item form" do
    render

    response.should have_tag("form[action=?][method=post]", items_path) do
      with_tag("input#item_title[name=?]", "item[title]")
      with_tag("input#item_type[name=?]", "item[type]")
      with_tag("input#item_status[name=?]", "item[status]")
      with_tag("input#item_user_id[name=?]", "item[user_id]")
    end
  end
end
