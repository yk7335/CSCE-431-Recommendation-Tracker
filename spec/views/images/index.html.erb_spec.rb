require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        id: "Id"
      ),
      Image.create!(
        id: "Id"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: "Id".to_s, count: 2
  end
end
