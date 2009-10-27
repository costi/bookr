require 'spec_helper'

describe "/items/edit.html.erb" do
  include ItemsHelper

  before(:each) do
    assigns[:item] = @item = stub_model(Item,
      :new_record? => false,
      :title => "value for title",
      :type => "value for type",
      :status => "value for status",
      :user_id => 1
    )
  end

  it "renders the edit item form" do
    render

    response.should have_tag("form[action=#{item_path(@item)}][method=post]") do
      with_tag('input#item_title[name=?]', "item[title]")
      with_tag('input#item_type[name=?]', "item[type]")
      with_tag('input#item_status[name=?]', "item[status]")
      with_tag('input#item_user_id[name=?]', "item[user_id]")
    end
  end
end
